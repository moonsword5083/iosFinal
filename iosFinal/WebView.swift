//
//  Vedio.swift
//  iosFinal
//
//  Created by User20 on 2020/6/19.
//  Copyright © 2020 ntou. All rights reserved.
//

import SwiftUI
import WebKit
struct WebView: UIViewRepresentable {
    
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
    
    typealias UIViewType = WKWebView
}
