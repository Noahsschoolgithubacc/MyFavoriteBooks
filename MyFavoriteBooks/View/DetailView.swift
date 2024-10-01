//
//  DetailView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 10/1/24.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailView: View {
    
    @ObservedObject var book: Book
    @EnvironmentObject var library: Library
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button {
                    book.myFavoriteBooks.toggle()
                } label: {
                    Image(systemName: book.myFavoriteBooks ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 48, weight: .light))
                }
                BookView(book: book, titleFont: .title, authorFont: .title2)
            }
            ReviewAndImageStackView(book: book, image: $library.images[book])
        }
        .onDisappear {
            withAnimation {
                library.sortBooks()
            }
        }
        .padding()
    }
}

#Preview {
    DetailView(book: .init())
        .environmentObject(Library())
        .padding()
}
