//
//  ContentView.swift
//  FilmBook
//
//  Created by Taner Çelik on 3.05.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // Test
            Button {
                DownloaderClient().filmleriIndır(search: "Bergman") { sonuc in
                    switch sonuc {
                    case .success(let filmDizisi):
                        print(filmDizisi)
                          
                    case .failure(let hata):
                        print(hata)
                    }
                }
            } label: {
                Text("Verileri indir")
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
