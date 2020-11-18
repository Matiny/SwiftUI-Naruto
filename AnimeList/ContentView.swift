//
//  ContentView.swift
//  AnimeList
//
//  Created by Matiny L on 11/18/20.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var data = getData()
    @ObservedObject var data:AnimeClass
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(data.anime ?? [Anime](), id: \.mal_id) {
                        anime in
                        
                        VStack{
                            Text(anime.title).frame(maxHeight: .infinity, alignment: .top)
                            URLImage(url: anime.image_url).frame(width: 120, height: 200, alignment: .center)
                        }
                    }
                }
            }.navigationTitle("Naruto SwiftUI").foregroundColor(.black)
        }
        
            .padding()
            .onAppear {
                data.getAll()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(data: AnimeClass())
    }
}
