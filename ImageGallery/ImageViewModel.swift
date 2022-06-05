//
//  ImageViewModel.swift
//  GalleryApp
//
//  Created by Tuğçe Arar on 5.06.2022.
//

import Foundation
import CoreLocation
import SwiftUI
import Combine

final class ImageViewModel: ObservableObject
{
        private let url = "https://picsum.photos/v2/list"
        private var task: AnyCancellable?
        
        @Published var images: Image = []
        
        func fetchImages() {
            task = URLSession.shared.dataTaskPublisher(for: URL(string: url)!)
                .map { $0.data }
                .decode(type: Image.self, decoder: JSONDecoder())
                .replaceError(with: [])
                .eraseToAnyPublisher()
                .receive(on: RunLoop.main)
                .assign(to: \ImageViewModel.images, on: self)
        }
}
