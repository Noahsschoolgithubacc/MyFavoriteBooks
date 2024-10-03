//
//  MyFavoriteBooksApp.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/25/24.
//

import SwiftUI

@main
struct MyFavoriteBooksApp: App {
    
    @StateObject private var library = Library()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
