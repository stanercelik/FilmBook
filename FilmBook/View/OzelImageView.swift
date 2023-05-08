//
//  OzelImageView.swift
//  FilmBook
//
//  Created by Taner Çelik on 7.05.2023.
//

import SwiftUI

struct OzelImageView: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient  =  ImageDownloaderClient()
    
    init (url: String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            return Image("")
                .resizable()
        }
    }
}

struct OzelImageView_Previews: PreviewProvider {
    static var previews: some View {
        OzelImageView(url: "https://m.media-amazon.com/images/M/MV5BNjM0NTc0NzItM2FlYS00YzEwLWE0YmUtNTA2ZWIzODc2OTgxXkEyXkFqcGdeQXVyNTgwNzIyNzg@._V1_SX300.jpg")
    }
}
