//
//  APIClient.swift
//  SampleQiitaList
//
//  Created by fuwamaki on 2022/01/16.
//

import Foundation

final class APIClient {
    func fetchQiitaItem(query: String, completion: @escaping (Result<[QiitaItem], NSError>) -> Void) {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: config)
        let url = URL(string: "https://qiita.com/api/v2/items?query=\(query)&page=1&per_page=50")!
        let task: URLSessionDataTask = session.dataTask(with: url) { (data, response, error) -> Void in
            if let error = error {
                completion(.failure(error as NSError))
            } else if
                let data = data,
                let response = response as? HTTPURLResponse,
                response.statusCode >= 200 && response.statusCode < 300 {
                do {
                    let items = try JSONDecoder().decode([QiitaItem].self, from: data)
                    completion(.success(items))
                } catch let error {
                    completion(.failure(error as NSError))
                }
            }
        }
        task.resume()
    }
}
