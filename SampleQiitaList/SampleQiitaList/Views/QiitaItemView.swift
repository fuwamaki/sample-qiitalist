//
//  QiitaItemView.swift
//  SampleQiitaList
//
//  Created by fuwamaki on 2022/01/16.
//

import SwiftUI
import URLImage

struct QiitaItemView: View {
    let item: QiitaItem

    var body: some View {
        HStack {
            URLImage(URL(string: item.user.profileImageUrl)!) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
            }
            .frame(width: 60.0, height: 60.0)
            Text(item.title)
        }
    }
}

struct QiitaItemView_Previews: PreviewProvider {
    static var previews: some View {
        QiitaWebView(title: "title", url: "https://www.google.com/")
    }
}

