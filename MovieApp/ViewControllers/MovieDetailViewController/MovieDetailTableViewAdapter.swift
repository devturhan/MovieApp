//
//  MovieDetailTableViewAdapter.swift
//  MovieApp
//
//  Created by Ömer Turhan on 7.05.2019.
//  Copyright © 2019 Ömer Turhan. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailTableViewAdapter:NSObject {
    weak var tableView: UITableView?
    let dataSource: Movie
    
    init(tableView: UITableView,
         dataSource: Movie) {
        self.tableView = tableView
        self.dataSource = dataSource
        super.init()
        configureTableView()
        registerCells()
    }
    
    func configureTableView(){
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.tableFooterView = UIView()
    }
    
    func registerCells(){
        let bundle = Bundle(for: MovieDetailTableViewCell.self)
        tableView?.register(UINib(nibName: "MovieDetailTableViewCell", bundle: bundle), forCellReuseIdentifier: "MovieDetailTableViewCell")
    }
    
}

extension MovieDetailTableViewAdapter: UITableViewDelegate {
    
}

extension MovieDetailTableViewAdapter: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MovieDetailTableViewCell", for: indexPath) as? MovieDetailTableViewCell else { fatalError("")}
        let cellViewModel = MovieDetailTableViewCellViewModel.init(movie: dataSource)
        cell.configure(cellViewModel)
        return cell
    }
    
}

