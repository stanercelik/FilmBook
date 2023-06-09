//
//  DownloaderClient.swift
//  FilmBook
//
//  Created by Taner Çelik on 4.05.2023.
//

import Foundation

class DownloaderClient{
    
    func filmleriIndır(search: String, completion : @escaping (Result<[Film]?, DownloaderError>) -> Void ) {
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=6d6ea303") else{
            return completion(.failure(.yanlisUrl))
        }
        
        
        URLSession.shared.dataTask(with: url) {  (data, response, error) in
            guard let data = data , error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabı = try? JSONDecoder().decode(GelenFilmler.self, from: data) else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(filmCevabı.filmler))
        } .resume()
    }
    
    
    
    // Tek bir filmi indirmek için gereken downloader client
    
    func filmDetayiIndir (imdbId: String, completion : @escaping (Result<FilmDetay, DownloaderError>) -> Void ) {
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=6d6ea303") else{
            return completion(.failure(.yanlisUrl))
        }
        
        URLSession.shared.dataTask(with: url) {  (data, response, error) in
            guard let data = data , error == nil else {
                return completion(.failure(.veriGelmedi))
            }
            
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self, from: data)
            else {
                return completion(.failure(.veriIslenemedi))
            }
            completion(.success(gelenFilmDetayi))
        }.resume()
        
    }
    
}

    
enum DownloaderError : Error {
    case yanlisUrl
    case veriGelmedi
    case veriIslenemedi
}
