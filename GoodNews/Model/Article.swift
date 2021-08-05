//
//  Article.swift
//  GoodNews
//
//  Created by Taisei Sakamoto on 2021/03/09.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&apiKey=7ee2551838e044c0b4ae992c8f572004")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String?
}
