//
//  MovieModel.swift
//  MovieBrowser
//
//  Created by Rave Bizz on 6/13/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation

struct Response: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let title: String?
    let overview: String?
    let poster_path: String?
    let release_date: String?
    let vote_average: Double?
}
