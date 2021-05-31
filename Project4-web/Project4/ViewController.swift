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
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.sizeToFit() //take up as much space as it needs to show the progressview
        let progressButton = UIBarButtonItem(customView: progressView)
        
        toolbarItems = [progressButton, spacer, refresh]
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
        
        let url = URL(string: "https://www.hackingwithswift.com")! //force unwrap url
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true //swipe left/right to move backward/forward
    }
    
    @objc func openTapped(){
        let ac = UIAlertController(title: "Open page...", message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "apple.com", style: .default, handler: openPage))
        ac.addAction(UIAlertAction(title: "hackingwithswift.com", style: .default, handler: openPage))
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

}

