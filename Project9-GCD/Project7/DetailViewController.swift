//
//  DetailViewController.swift
//  Project7
//
//  Created by Bai on 8/6/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView: WKWebView!
    var detailItem: Petition?
    
    override func loadView() {
        webView = WKWebView() //similar to Project4
        //WKWebView renders content from the web
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else { return }
        //guard unwraps detailItem into itself if it has a value. exits the method if data didnt get passed into the detail view controller
        
        let html = """
        <html>
        <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style> body { font-size: 150%; } </style>
        </head>
        
        <body>
        \(detailItem.body)
        </body>
        </html>
        """
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
