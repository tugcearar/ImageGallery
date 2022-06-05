//
//  MainView.swift
//  GalleryApp
//
//  Created by Tuğçe Arar on 2.06.2022.
//

import SwiftUI
import NukeUI
import Nuke

struct MainView: View {
    @ObservedObject var imageVM = ImageViewModel()
    
    private static let initialColumns = 3
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: initialColumns)
    @State private var numColumns = initialColumns
    
    private let pipeline = ImagePipeline {
        $0.dataLoader = {
            let config = URLSessionConfiguration.default
            config.urlCache = nil
            return DataLoader(configuration: config)
        }()
    }
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(imageVM.images) { image in
                        GeometryReader { geo in
                            NavigationLink(destination: ImageDetailView(item: image)) {
                                ZStack(alignment: .topTrailing) {
                                    if let url = image.downloadURL {
                                        makeImage(url: URL(string:url)!)
                                    }
                                }
                            }
                        }
                        .cornerRadius(8.0)
                        .aspectRatio(1, contentMode: .fit)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Images")
        .onAppear{
            self.imageVM.fetchImages()
        }
    }
    func makeImage(url: URL) -> some View {
        LazyImage(source: url)
            .animation(.default)
            .pipeline(pipeline)
            .frame(height: 320)
        
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        let imageVM = ImageViewModel()
        MainView(imageVM: imageVM)
    }
}
