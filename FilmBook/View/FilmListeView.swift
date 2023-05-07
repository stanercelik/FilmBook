//
//  ContentView.swift
//  FilmBook
//
//  Created by Taner Çelik on 3.05.2023.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        self.filmListeViewModel.filmAramasiYap(filmIsmi: "Autumn")
    }
    
    
    
    var body: some View {
        List(filmListeViewModel.filmler, id: \.imdbId) {
            film in
            HStack{
                Image("placeholder2")
                    .resizable()
                    .frame(width: 100, height: 150)
                
                VStack (alignment: .leading){
                    Text(film.title)
                        .font(.title3).bold()
                    
                    
                    Text(film.year)
                        .font(.subheadline)
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
