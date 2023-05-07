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
        self.filmListeViewModel.filmAramasiYap(filmIsmi: "portrait")
    }
    
    
    
    var body: some View {
        NavigationView{
            List(filmListeViewModel.filmler, id: \.imdbId) {
                film in
                HStack{
                    OzelImageView(url: film.poster)
                        .frame(width: 90, height: 130)
                    
                    VStack (alignment: .leading){
                        Text(film.title)
                            .font(.title3).bold()
                        
                        
                        Text(film.year)
                            .font(.subheadline)
                        
                    }
                }
            } .navigationTitle("Film Book")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
