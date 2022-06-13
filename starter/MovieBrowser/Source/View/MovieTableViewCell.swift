//
//  MovieTableViewCell.swift
//  MovieBrowser
//
//  Created by Rave Bizz on 6/13/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    static let identifier = String(describing: MovieTableViewCell.self)
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var score: UILabel!
    
    
}
