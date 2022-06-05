//
//  ImageGalleryApp.swift
//  ImageGallery
//
//  Created by Tuğçe Arar on 5.06.2022.
//

import SwiftUI

@main
struct ImageGalleryApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView(imageVM: ImageViewModel())
            } 
            .navigationViewStyle(.stack)
        }
    }
}
