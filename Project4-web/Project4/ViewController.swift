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


}

