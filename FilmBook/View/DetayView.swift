//
//  DetayView.swift
//  FilmBook
//
//  Created by Taner Çelik on 7.05.2023.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId : String
    
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()

    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 5){
            HStack{
                Spacer()
                OzelImageView(url: filmDetayViewModel.filmDetayi?.poster ?? "")
                .frame(width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height * 0.3)
                .padding(.vertical)
                Spacer()
            }
                
                Text(filmDetayViewModel.filmDetayi?.title ?? "Film Title ")
                .font(.largeTitle).bold().padding(.init(top: 8, leading: 8, bottom: 0, trailing: 8))
                
            
            Text("Director: \(filmDetayViewModel.filmDetayi?.director ?? "Director Name")").font(.body).padding(.init(top: 8, leading: 8, bottom: 0, trailing: 8))
            
                HStack(){
                    Text(filmDetayViewModel.filmDetayi?.genre ?? "Film Genre")
                    Spacer()
                    Text("\(filmDetayViewModel.filmDetayi?.runtime ?? "Film Runtime") minutes")
                }
                .padding(.init(top: 8, leading: 8, bottom: 0, trailing: 8))
            
            Text("IMDB: \(filmDetayViewModel.filmDetayi?.imdbRating ?? "Imdb Rating")").padding(.init(top: 8, leading: 8, bottom: 0, trailing: 8))
            
            Text("Metascore: \(filmDetayViewModel.filmDetayi?.metascore ?? "Metascore Rating")").padding(.init(top: 8, leading: 8, bottom: 0, trailing: 8))
            
            Text("Awards: \(filmDetayViewModel.filmDetayi?.awards ?? "Film Awards")")
                .padding(.init(top: 8, leading: 8, bottom: 0, trailing: 8))
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film Plot").padding(.init(top: 8, leading: 8, bottom: 0, trailing: 8))
            Spacer()
            
            
                
            
        }.onAppear {
            self.filmDetayViewModel.filmDetayiAl(imdbId: imdbId)
        }
    }
}

struct DetayView_Previews: PreviewProvider {
    static var previews: some View {
        DetayView(imdbId: "test")
    }
}
