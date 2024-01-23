//
//  HomeViewController.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 11-01-24.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    var data: EarthQuake?
    
    lazy var homeView: HomeView = {
        let view = HomeView()
        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = homeView
        fetchData()
    }    
}

extension HomeViewController {
    
    private func fetchData() {
        NetworkService.shared.fetchData { result in
            switch result {
            case .success(let data):
                // Procesar los datos
                self.data = data
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}
