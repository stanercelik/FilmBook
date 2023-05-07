//
//  FilmDetay.swift
//  FilmBook
//
//  Created by Taner Çelik on 7.05.2023.
//

import Foundation

struct FilmDetay : Codable {
    
    let title : String
    let year : String
    let runtime : String
    let genre : String
    let director : String
    let actors : String
    let plot : String
    let poster : String
    let awards : String
    let metascore : String
    let imdbRating : String
    let imdbId : String
    
    
    private enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case actor = "Actor"
        case plot = "Plot"
        case awards = "Awards"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
    }
}
