//
//  ContentView.swift
//  SampleQiitaList
//
//  Created by fuwamaki on 2022/01/16.
//

import SwiftUI

struct ContentView: View {
    private var apiClient = APIClient()
    @State var keyword: String = ""
    @State var isLoading = false
    @State var items: [QiitaItem] = []

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List(items) { item in
                        NavigationLink(
                            destination: QiitaWebView(
                                title: item.title,
                                url: item.url
                            )
                        ) {
                            QiitaItemView(item: item)
                        }
                    }
                }
                if isLoading {
                    ActivityIndicator()
                }
            }
            .navigationBarTitle(Text("リスト"))
        }
        .searchable(text: $keyword)
        .onSubmit(of: .search, {
            isLoading = true
            apiClient.fetchQiitaItem(query: keyword) { result in
                isLoading = false
                switch result {
                case .success(let items):
                    self.items = items
                case .failure(let error):
                    debugPrint(error.localizedDescription)
                }
            }
        })
        .accentColor(.teal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
