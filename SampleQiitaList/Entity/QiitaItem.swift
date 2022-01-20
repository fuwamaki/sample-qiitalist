//
//  QiitaItem.swift
//  SampleQiitaList
//
//  Created by fuwamaki on 2022/01/16.
//

import Foundation

struct QiitaItem: Codable, Identifiable {
    let id: String
    let title: String
    let url: String
    let user: QiitaItemUser
}

struct QiitaItemUser: Codable {
    let profileImageUrl: String

    enum CodingKeys: String, CodingKey {
        case profileImageUrl = "profile_image_url"
    }
}
