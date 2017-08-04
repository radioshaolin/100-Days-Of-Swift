//
//  WebViewController.swift
//  WorldTrotter
//
//  Created by Radio Shaolin on 04.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        
        webView = WKWebView()
        view = webView
        webView.navigationDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("WebViewController loaded its view.")
        
        guard let url = URL(string: "https://www.bignerdranch.com") else { return }
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
        webView.allowsBackForwardNavigationGestures = true
    }
}
