//
//  Extension+DataSource.swift
//  MovieBrowser
//
//  Created by Rave Bizz on 6/13/22.
//  Copyright © 2022 Lowe's Home Improvement. All rights reserved.
//

import Foundation
import UIKit

extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieModal?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        let model = viewModel.movieModal?.results[indexPath.row]
        
        cell.score.text = String(describing: model?.vote_average ?? 0)
        cell.releaseDate.text = DateFormat.shared.getDate(date: model?.release_date) ?? "N/A"
        cell.title.text = model?.title ?? "N/A"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "MovieDetail", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: MovieDetailViewController.identifier) as? MovieDetailViewController
        
        let model = viewModel.movieModal?.results[indexPath.row]
        
        vc?.titleStr = model?.title
        vc?.dateStr = DateFormat.shared.getDate(date: model?.release_date)
        vc?.overviewStr = model?.overview ?? "N/A"
        
        if let imgUrl = viewModel.fetchImgUrl(path: model?.poster_path), let url = URL(string: imgUrl){
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard let data = data else{
                    return
                }
                if (error != nil){
                    let image = UIImage(named: "placeholder")
                    DispatchQueue.main.async {
                        vc?.img.image = image
                    }
                } else {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        vc?.img.image = image
                    }
                }
            }).resume()
        }
        navigationController?.pushViewController(vc ?? MovieDetailViewController(), animated: true)
    }
    
}
