//
//  MovieDetailViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/26/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var img: UIImageView!
    
    @IBOutlet weak var overviewText: UITextView!
    static let identifier = String(describing: MovieDetailViewController.self)
    
    var imgURL: String?
    var titleStr: String?
    var dateStr: String?
    var overviewStr: String?
    var movieImg = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView()
    }
    
    private func contentView(){
        self.navigationController?.navigationItem.leftBarButtonItem?.title = "Movie Search"
        
        self.date.text = dateStr
        self.movieTitle.text = titleStr
        self.overviewText.text = overviewStr
        self.img.image = movieImg
        
    }
}
