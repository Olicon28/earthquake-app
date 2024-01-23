//
//  TableViewDataSource.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 11-01-24.
//

import Foundation
import UIKit

class TableViewDataSource: NSObject, UITableViewDelegate, UITableViewDataSource {
    
    let dataSource: EarthQuake.Feature
    
    override init(data: EarthQuake.Feature) {
        self.dataSource = data
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else { return UITableViewCell() }
    
        cell.title.text = dataSource[indexPath.row].title
        cell.maginitud.text = dataSource[indexPath.row].magnitud
        cell.lugar.text = dataSource[indexPath.row].lugar
        cell.profundidad.text = dataSource[indexPath.row].profundidad
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}
