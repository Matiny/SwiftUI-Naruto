//
//  ImageLoader.swift
//  AnimeList
//
//  Created by Matiny L on 11/18/20.
//

import Foundation

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImg(url: String) {
        guard let imageURL = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            guard let data = data, error == nil else {return}
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }.resume()
    }
}
