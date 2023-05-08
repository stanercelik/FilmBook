//
//  FilmDetayViewModel.swift
//  FilmBook
//
//  Created by Taner Çelik on 7.05.2023.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    
    @Published var filmDetayi : FilmDetaylariViewModel?
    
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl (imdbId : String) {
        downloaderClient.filmDetayiIndir(imdbId: imdbId) { (sonuc) in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let filmDetay):
                self.filmDetayi = FilmDetaylariViewModel(detay: filmDetay)
            }
        }
    }
}


struct FilmDetaylariViewModel {
    
    let detay : FilmDetay
    
    var title : String {
        detay.title
    }
    var genre : String {
        detay.genre
    }
    var year : String {
        detay.year
    }
    var actors : String {
        detay.actors
    }
    var awards : String {
        detay.awards
    }
    var director : String {
        detay.director
    }
    var imdbId : String {
        detay.imdbId
    }
    var imdbRating : String {
        detay.imdbRating
    }
    var metascore : String {
        detay.metascore
    }
    var plot : String {
        detay.plot
    }
    var poster : String {
        detay.poster
    }
    var runtime : String {
        detay.runtime
    }
    
    
}
