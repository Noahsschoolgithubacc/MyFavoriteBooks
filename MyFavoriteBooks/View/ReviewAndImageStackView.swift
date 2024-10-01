//
//  ReviewAndImageStackView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/30/24.
//

import SwiftUI

struct ReviewAndImageStackView: View {
    
    @ObservedObject var book: Book
    @Binding var image: Image?
    @State var showImagePicker = false
    @State var showingDialog = false
    
    var body: some View {
        VStack {
            Divider()
                .padding(.vertical)
            TextField("Review...", text: $book.microReview)
            Divider()
                .padding(.vertical)
            
            HStack {
                if image != nil {
                    Spacer()
                    Button("Delete Image") {
                        showingDialog = true
                    }
                }
                Spacer()
                Button("Update Image...") {
                    showImagePicker = true
                }
                
                Spacer()
            }
            
            .padding()
            
            Spacer()
        }
        
//        .sheet(isPresented: $showImagePicker) {
//            ImagePicker(image: $image)
//        }
    }
}

#Preview {
    ReviewAndImageStackView(book: .init(), image: .constant(nil))
}
