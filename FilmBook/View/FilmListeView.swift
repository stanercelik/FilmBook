//
//  ContentView.swift
//  FilmBook
//
//  Created by Taner Çelik on 3.05.2023.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    
    @State var aranacakFilm = ""
    
    init() {
        self.filmListeViewModel = FilmListeViewModel()
        
    }
    
    
    
    var body: some View {
        NavigationView{
            VStack{
                // onEditingChange kullanıcı yazarken bir şey yapayım mı
                // onCommit  kullanıcı entera basarsa bi şey yapayım mı
                TextField("Film Ara", text: self.$aranacakFilm, onEditingChanged: { _ in },
                          onCommit: {
                    self.filmListeViewModel
                        .filmAramasiYap (filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines)
                                         // Yeni satırları ve boşlukların formatını değiştir
                            .addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                    // url şeklinde göster yoksa direkt aranacak filmi göster.
                })
                .padding()
                .textFieldStyle(.roundedBorder)
                
                
                List(filmListeViewModel.filmler, id: \.imdbId) {
                    film in
                    NavigationLink (
                        destination:
                            DetayView(imdbId: film.imdbId),
                        label: {
                            HStack(){
                                OzelImageView(url: film.poster)
                                    .frame(width: 90, height: 130)
                                
                                VStack (alignment: .leading){
                                    Text(film.title)
                                        .font(.title3).bold()
                                    
                                    
                                    Text(film.year)
                                        .font(.subheadline)
                                    
                                }
                            }
                        })
                    
                    
                    
                }
            }.navigationTitle("Film Book")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListeView()
    }
}
