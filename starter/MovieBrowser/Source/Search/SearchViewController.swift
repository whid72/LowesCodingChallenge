//
//  SearchViewController.swift
//  SampleApp
//
//  Created by Struzinski, Mark on 2/19/21.
//  Copyright © 2021 Lowe's Home Improvement. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        tableConfig()
        contentView()
    }
    
    @IBAction func onSubmit(_ sender: Any) {
        guard let text = searchBar.text else { return }
        bindViewModel()
        viewModel.updateData(movie: text)
    }

    private func bindViewModel(){
        viewModel.updateUI = { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

    private func tableConfig(){
        let nib = UINib(nibName: MovieTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .white
    }
    
    private func contentView(){
        self.navigationController?.navigationBar.backgroundColor = .systemBlue
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .white
    }
    
}
