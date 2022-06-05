//
//  ImageDetailView.swift
//  GalleryApp
//
//  Created by Tuğçe Arar on 5.06.2022.
//
import SwiftUI

struct ImageDetailView: View {
    var item: ImageElement

    var body: some View {
        VStack{
            ZStack(alignment: .topTrailing) {
                if let item = item {
                    AsyncImage(url: URL(string:item.downloadURL)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                    }
                }
            }.padding(10)
            Button("Save to Gallery"){
                var image: UIImage?
                let urlString = item.downloadURL

                let url = NSURL(string: urlString)! as URL
                if let imageData: NSData = NSData(contentsOf: url) {
                    image = UIImage(data: imageData as Data)
                }
                UIImageWriteToSavedPhotosAlbum(image!, nil, nil, nil)
            }
        }
    }
}
