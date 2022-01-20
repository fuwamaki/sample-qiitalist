//
//  WebView.swift
//  SampleQiitaList
//
//  Created by fuwamaki on 2022/01/16.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL

    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView(frame: .zero)
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        let req = URLRequest(url: url)
        uiView.load(req)
    }
}
