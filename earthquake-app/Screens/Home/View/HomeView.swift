//
//  HomeView.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 11-01-24.
//

import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var datasource = TableViewDataSource()
    
    var data: EarthQuake
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Terremotos"
        
        return label
    }()
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        table.delegate = datasource
        table.dataSource = datasource
        table.isUserInteractionEnabled = false
        
        return table
    }()
    
    init(data: EarthQuake) {        
        self.data = data
        super.init(frame: .zero)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HomeView {
    func setupViews() {
        self.backgroundColor = .white
        self.addSubview(title)
        self.addSubview(tableView)
        
        setupConstrints()
    }
    
    private func setupConstrints() {
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 50),
            self.title.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.title.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.heightAnchor.constraint(equalToConstant: 50),
            
            self.tableView.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 40),
            self.tableView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            self.tableView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            self.tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
}


