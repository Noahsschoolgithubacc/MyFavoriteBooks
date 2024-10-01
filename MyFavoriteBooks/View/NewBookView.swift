//
//  NewBookView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 10/1/24.
//

import SwiftUI

struct NewBookView: View {
    
    @ObservedObject var book = Book(title: "", author: "")
    @State var image: Image? = nil
    @EnvironmentObject var library: Library
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                TextField("Title", text: $book.title)
                TextField("Author", text: $book.author)
                ReviewAndImageStackView(book: book, image: $image)
            }
            .padding()
            .navigationTitle("Got a new book?")
            .toolbar {
                ToolbarItem(placement: .status) {
                    
                }
            }
        }
    }
}

#Preview {
    NewBookView()
}
