//
//  FilmViewModel.swift
//  FilmBook
//
//  Created by Taner Çelik on 7.05.2023.
//

import Foundation
import SwiftUI

class FilmListeViewModel : ObservableObject{ // Gözlemlenebilir obje
    //ObservableObject yaparak yayınlanabilir hale getiriyoruz.
    
    @Published var filmler = [FilmViewModel]()
    // Hangi viewdan buna subscribe olduysam değişikleri orada alabileceğim.
    
    let downloaderClient = DownloaderClient()
    
    func filmAramasiYap(filmIsmi: String) {
        downloaderClient.filmleriIndır(search: filmIsmi) { (sonuc) in
            switch sonuc {
            case.failure(let hata):
                print(hata)
            
            case.success(let filmDizisi):
                if let filmDizisi = filmDizisi {
                    DispatchQueue.main.async {
                        // Kullanıcı arayüzünde değişikliğe neden olacağı için yapmamız gerekiyor
                        self.filmler = filmDizisi.map(FilmViewModel.init)
                    }
                    
                }
            }
        }
    }
    
    
}

// Neleri göstermek istediğimizi seçebiliyoruz.

struct FilmViewModel {
    
    let film : Film
    
    var title: String {
        film.title
    }
    
    var poster : String {
        film.poster
    }
    
    var year : String {
        film.year
    }
    
    var imdbId : String {
        film.imdbId
    }
    
}
