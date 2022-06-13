//
//  MovieViewModel.swift
//  MovieBrowser
//
//  Created by Rave Bizz on 6/13/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    var movieModal: Response? {
        didSet{
            DispatchQueue.main.async {
                self.updateUI(self.movieModal)
            }
        }willSet{
            print("new data \(String(describing: newValue))")
        }
    }
    
    private var network = Network()
    
    var updateUI: (Response?) -> Void = { _ in }
    
    func fetchImgUrl(path: String?) -> String?{
        return network.fetchImageUrl(path: path)
    }
    
    func updateData(movie: String?){
        network.fetchData(movie: movie) { model in
            self.movieModal = model
        }
    }
}
