//
//  ViewController.swift
//  Project4
//
//  Created by Bai on 27/5/21.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate { //extends to UIViewController, conforms to WKNavigationDelegate protocol.
    var webView: WKWebView!
    var progressView: UIProgressView!
    var websites = ["apple.com", "hackingwithswift.com"]
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        /* delegation - programming pattern
        - tell WKWebView that we want to be informed when something happens (when any web page navigation happens, please tell me the current view controller)
        (*) conform to the protocol
        */
        
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Open", style: .plain, target: self, action: #selector(openTapped))
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) //target is nil because it can't be tapped
        let refresh = UIBarButtonItem(barButtonSystemItem: .refresh, target: webView, action: #selector(webView.reload)) //reload webview. refresh button is aligned to the right because flexible space takes up all the available space on the left
        let back = UIBarButtonItem(barButtonSystemItem: .rewind, target: webView, action: #selector(webView.goBack))
        let forward = UIBarButtonItem(barButtonSystemItem: .fastForward, target: webView, action: #selector(webView.goForward))
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit() //take up as much space as it needs to show the progressview
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressButton, spacer, refresh, back, forward]
        navigationController?.isToolbarHidden = false
        
        webView.addObserver(self, forKeyPath: #keyPath(WKWebView.estimatedProgress), options: .new, context: nil)
        
        /* Observer - 4 parameters
         1. who the observer is
         2. what property we want to observe
            * forKeyPath : specify a path
            * #keyPatrh : allows the compiler to check that code is correct - that the WKWebView class actually has an estimatedProgress property.
         3. which value we want (we want the value that was just set, so we want the new one)
         4. context value
            * if you provide a unique value, that same context value gets sent back to you when you get your notification that the value has changed (??)
         
         > in more complex applications, all calls to addObserver() should be matched with a call to removeObserver() when you're finished observing - for example, when you're done with a view controller
         
         after registering an observer, must implement a method called observeValue() which tells you when an observed value has changed.
         */
        
        let url = URL(string: "https://" + websites[0])! //force unwrap url
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true //swipe left/right to move backward/forward
    }
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        for website in websites {
            ac.addAction(UIAlertAction(title: website, style: .default, handler: openPage))
        }
        ac.addAction(UIAlertAction(title: "google.com", style: .default, handler: openPage)) //website not in safe list
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem //impt for ipad
        present(ac, animated: true)
        
    }
    
    func openPage(action: UIAlertAction) {
        /* let url = URL(string: "https://" + action.title!)! //double force unwrap 1) action.title & finished url
        
        OR
        
        */
        guard let actionTitle = action.title else { return }
        guard let url = URL(string: "https://" + actionTitle) else { return }
        webView.load(URLRequest(url: url))
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        title = webView.title
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.progress = Float(webView.estimatedProgress)
        }
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) { //belongs to the WKNavigationDelegate protocol
        
        /*this delegate callback allows us to decide whether we want to allow navigation to happen or not every time something happens
         
         *check which part of the page started the navigation
         *see whether it was triggered by a link being clicked or a form being submitted
         *check the URL to see whether we like it <<<
         
         *pass parameter: decisionHandler -> holds a function/closure? escaping closure (the closure has the potential to escape the current method, and be used at a later date)
         *method's response: load the page or not
 
        */
        
        let url = navigationAction.request.url
        
        //evaluate the URL to see whether it's in our safe list, then call the decisionHandler with a negative or positive answer
        if let host = url?.host { //host = website domain like apple.com. if there is a host for this url, pull it out
            for website in websites { //loop through all sites in our safe list
                if (!(host.contains(website))) {
                    let ac = UIAlertController(title: "This website is blocked", message: nil, preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "Okay", style: .cancel))
                    present(ac, animated: true)
                } else {
                //if host.contains(website) { //check to see whether each safe website exists somewhere in the host name
                    decisionHandler(.allow) //positive
                    return //exit method
                }
            }
            
            
        }
        decisionHandler(.cancel) //no host set -> cancel loading.
        
        //issue: alert shows when URL != homepage??
        
    }
    
    

}

