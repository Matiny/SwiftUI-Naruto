//
//  AnimeData.swift
//  AnimeList
//
//  Created by Matiny L on 11/18/20.
//

import Foundation

struct Main: Decodable {
    let results: [Anime]
}

struct Anime: Decodable {
    let title: String
    let synopsis: String
    let mal_id: Int
    let image_url: String
}


class AnimeClass: ObservableObject {
    @Published var anime: [Anime]? = [Anime]()
    
    let string = "https://api.jikan.moe/v3/search/anime?q=naruto"
    
    func getAll() {
        guard let url = URL(string: string)
        else { fatalError("Invalid URL" ) }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let animeResponse = try? JSONDecoder().decode(Main.self, from: data)
            if let animeResponse = animeResponse {
                DispatchQueue.main.async {
                    self.anime = animeResponse.results
                }
            }
        }.resume()
    }
    
}
