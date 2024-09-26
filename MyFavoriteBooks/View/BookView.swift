//
//  BookView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/25/24.
//

import SwiftUI

struct BookView: View {
    
    let book: Book
    let titleFont: Font
    let authorFont: Font
    
    var body: some View {
        VStack {
            Text(book.title)
                .font(titleFont)
            Text(book.author)
                .font(authorFont)
        }
    }
}

extension Book {
    
    // a custom view for displaying custom book images and system images
    struct Image: View {
        
            let image: SwiftUI.Image?
            let title: String
            var size: CGFloat?
            let cornerRadius: CGFloat
        
        var body: some View {
            
            if let image = image {
                // renders the custom image modifiers
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .cornerRadius(cornerRadius)
                
            } else {
                // generates the system image (book icon) using the first character of the books title, if theres no book
                let symbol = SwiftUI.Image(title: title)
                ??
                // if the system image cant be generated, fallback to default book icon
                    .init(systemName: "book")
                
                symbol
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .font(Font.title.weight(.light))
                    .foregroundColor(.secondary.opacity(0.5))
            }
        }
    }
}

extension Image {
    // initializes an image with a system symbol derived from first character of the provided title
    init?(title: String) {
        // extracts the first character from the title
        guard let character = title.first,
              // creates a symbol name based on the lowercase representation of the first character followed by "square"
              case let symbolName = "\(character.lowercased()).square",
              // checks if a system image exists for the generated symbol name
              UIImage(systemName: symbolName) != nil
        else {
            // if no sys image is found returns nil
            return nil
        }
        // initializes the Image with the system symbol name
        self.init(systemName: symbolName)
    }
}

extension Book.Image {
    init(title: String) {
        self.init(image: nil, title: title, cornerRadius: .init())
    }
}


#Preview {
    VStack {
        BookView(book: .init(), titleFont: .title, authorFont: .title2)
        Book.Image(title: Book().title)
        Book.Image(title: "")
        Book.Image(title: "📖")
    }
}
