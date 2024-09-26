//
//  Library.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/26/24.
//

import Combine
import SwiftUI

class Library: ObservableObject {
    
    // organizes books into sections based on their property
    var sortedBooks: [Section: [Book]] {
        get {
            // groups based on property
            let groupedBooks = Dictionary(grouping: booksCache, by: \.myFavoriteBooks)
            
            // map grouped books to sections and returns as dictionary
            return Dictionary(uniqueKeysWithValues: groupedBooks.map {
                // use ternary operater to maps keys to = section types
                (($0.key ? .myFavoriteBooks : .finished), $0.value)
            })
        } set {
            // sorts based on their section keys
            booksCache = newValue
                .sorted { $1.key == .finished }
                .flatMap { $0.value}
        }
    }
    @Published var booksCache: [Book] = [
        .init(title: "Gregor the Overlander", author: "Suzanne Collins", microReview: "10/10"),
        .init(title: "Gregor and the Prophecy of Bane", author: "Suzanne Collins", microReview: "10/10"),
        .init(title: "Gregor and the Curse of the Warmbloods", author: "Suzanne Collins", microReview: "10/10"),
        .init(title: "Gregor the the Marks of Secret", author: "Suzanne Collins", microReview: "10/10"),
        .init(title: "Gregor and the Code of Claw", author: "Suzanne Collins", microReview: "10/10"),
        .init(title: "Bible", author: "Like 100+ different people", microReview: "I'm not going to put my opinion here"),
        .init(title: "Hp and sorcerers stone", author: "J.K", microReview: "Great starter"),
        .init(title: "Hp and the chamber of secrets", author: "J.K", microReview: "How so hidden?"),
        .init(title: "Hp and the prisoner of azkaban", author: "J.K", microReview: "Opens plot holes"),
        .init(title: "Hp and the goblet of fire", author: "J.K", microReview: "Part of it didn't make sense to me")
    ]
    
    @Published var images: [Book: Image] = [:]
    init () {
        if let gregor1 = booksCache.first(where: { $0.title == "Gregor the Overlander"}) {
            images[gregor1] = Image("gregor1")
        }
        if let gregor2 = booksCache.first(where: { $0.title == "gregor2"}) {
            images[gregor2] = Image("gregor2")
        }
        if let gregor3 = booksCache.first(where: { $0.title == "gregor3"}) {
            images[gregor3] = Image("gregor3")
        }
    }
    
}

// defines the possible sections in the library
enum Section: CaseIterable {
    case myFavoriteBooks
    case finished
}

