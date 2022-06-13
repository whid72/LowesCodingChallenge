//
//  Network.swift
//  SampleApp
//
//  Created by Struzinski, Mark - Mark on 9/17/20.
//  Copyright © 2020 Lowe's Home Improvement. All rights reserved.
//

import UIKit

//

class Network {
    
    let apiKey = "5885c445eab51c7004916b9c0313e2d3"
    
    var response: Response?
    
    func fetchData(movie: String?, completion: @escaping (Response?) -> Void){
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "api.themoviedb.org"
        urlComponents.path = "/3/search/movie"
        urlComponents.queryItems = [
        URLQueryItem(name: "api_key", value: apiKey),
        URLQueryItem(name: "language", value: "en-US"),
        URLQueryItem(name: "query", value: movie),
        URLQueryItem(name: "page", value: "1"),
        URLQueryItem(name: "include_adult", value: "false")
        ]
        
        if let url = urlComponents.url {
            URLSession.shared.dataTask(with: url) { data, resp, error in
                guard let data = data else { return }
                    self.decodeData(data: data, completion: completion)
            }.resume()
        }
        
    }
    
    //https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
    func fetchImageUrl(path: String?) -> String?{
        var urlComponents = URLComponents()
        
        urlComponents.scheme = "https"
        urlComponents.host = "image.tmdb.org"
        urlComponents.path = "/t/p/original/"
        
        let imgStr = "\(urlComponents.string ?? "")\(path ?? "")"
        return imgStr
    }
    
    private func decodeData(data: Data, completion: @escaping (Response?) -> Void) {
        do{
            let feedResponse = try JSONDecoder().decode(Response.self, from: data)
            completion(feedResponse)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
}
