//
//  Film.swift
//  FilmBook
//
//  Created by Taner Çelik on 3.05.2023.
//

import Foundation

struct Film : Codable {
    
    let title : String
    let year : String
    let imdbId : String
    let type : String
    let poster : String
    
    
    //Dışarıdan gelen Title'ı görünce bu biizm tanımladığımız olan title'dır.
    //Type vs sıkıntı çıkarabileceği için type olarka yazıp enumla eşleştirdik .
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbId"
        case type = "type"
        case poster = "Poster"
    }
    
}

struct IcomingMovies : Codable {
    
    let filmler : [Film]
    
    private enum CodingKeys : String , CodingKey {
        
         case filmler = "Search"
    }
    
}
