//
//  QiitaWebView.swift
//  SampleQiitaList
//
//  Created by fuwamaki on 2022/01/16.
//

import SwiftUI

struct QiitaWebView: View {
    let title: String
    let url: String

    var body: some View {
        WebView(url: URL(string: url)!)
            .edgesIgnoringSafeArea(.bottom)
            .navigationBarTitle(Text(title), displayMode: .inline)
    }
}

struct QiitaWebView_Previews: PreviewProvider {
    static var previews: some View {
        QiitaWebView(title: "title", url: "https://www.google.com/")
    }
}
