//
//  Book.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/25/24.
//

import Combine
// combine = framework that provides a declarative Swift API for processing
// API = Application Programming Interface

// class = similar to a struct but are reference types and structs are value types
class Book: ObservableObject {
    
    @Published var title: String
    @Published var author: String
    @Published var microReview: String
    @Published var myFavoriteBooks: Bool
    
    init(title: String = "Title", author: String = "Author", microReview: String = "", myFavoriteBooks: Bool = true) {
        self.title = title
        self.author = author
        self.microReview = microReview
        self.myFavoriteBooks = myFavoriteBooks // Equitable = fancy word for comparing objects
    }
}

// extension used to compare instance of books
extension Book: Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs === rhs
    // === = identity operater
    // hash value = a numerical value of a fixed length that uniquely identifies the data
        // hashable = tells the object it has a hash value
        // identifiable = this is the protocal that uses UUID
        // UUID = Universal Unique Identifier, used to id in database
    }
}

// ensures each book has its own id. Used in our Book collection
extension Book: Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
