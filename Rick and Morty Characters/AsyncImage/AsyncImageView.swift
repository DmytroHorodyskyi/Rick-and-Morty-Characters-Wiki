//
//  AsyncImageView.swift
//  Rick and Morty Characters
//
//  Created by Dmytro Horodyskyi on 28.12.2024.
//

import SwiftUI

struct AsyncImageView: View {
    let url: URL?
    
    @State private var image: UIImage? = nil
    
    var body: some View {
        if let image = image {
            Image(uiImage: image)
                .resizable()
                .scaledToFit()
        } else {
            ProgressView()
                .onAppear {
                    loadImage()
                }
        }
    }
    
    private func loadImage() {
        guard let url else { return }
        if let cachedImage = ImageCache.shared.getImage(for: url) {
            self.image = cachedImage
        } else {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                if let data = data, let downloadedImage = UIImage(data: data) {
                    DispatchQueue.main.async {
                        ImageCache.shared.setImage(downloadedImage, for: url)
                        self.image = downloadedImage
                    }
                }
            }.resume()
        }
    }
}

#Preview {
    AsyncImageView(url: URL("https://rickandmortyapi.com/api/character/avatar/1.jpeg"))
}
