//
//  TableViewCell.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 11-01-24.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier: String = "customCell"
    
    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        
        return stack
    }()
    
    var title: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    var maginitud: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    var profundidad: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    var lugar: UILabel = {
        let label = UILabel()
        
        return label
    }()
    
    let moreDetails: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Más detalles", for: .normal)
        button.contentHorizontalAlignment = .right
        button.addTarget(self, action: #selector(didTapMoreDetail), for: .touchUpInside)
        
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TableViewCell{
    
    func setupViews() {
        
        self.addSubview(stackView)
        self.addSubview(moreDetails)
        
        self.stackView.addSubview(title)
        self.stackView.addSubview(maginitud)
        self.stackView.addSubview(profundidad)
        self.stackView.addSubview(lugar)
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.moreDetails.translatesAutoresizingMaskIntoConstraints = false
        self.title.translatesAutoresizingMaskIntoConstraints = false
        self.maginitud.translatesAutoresizingMaskIntoConstraints = false
        self.profundidad.translatesAutoresizingMaskIntoConstraints = false
        self.lugar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.moreDetails.leadingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.moreDetails.topAnchor.constraint(equalTo: self.topAnchor),
            self.moreDetails.leadingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.moreDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.moreDetails.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.title.topAnchor.constraint(equalTo: self.stackView.topAnchor),
            self.title.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.title.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.title.heightAnchor.constraint(equalToConstant: 20),
            
            self.maginitud.topAnchor.constraint(equalTo: self.title.bottomAnchor),
            self.maginitud.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.maginitud.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.maginitud.heightAnchor.constraint(equalToConstant: 20),
            
            self.profundidad.topAnchor.constraint(equalTo: self.maginitud.bottomAnchor),
            self.profundidad.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.profundidad.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.profundidad.heightAnchor.constraint(equalToConstant: 20),
            
            self.lugar.topAnchor.constraint(equalTo: self.profundidad.bottomAnchor),
            self.lugar.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor),
            self.lugar.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.lugar.heightAnchor.constraint(equalToConstant: 20),
            
            self.moreDetails.topAnchor.constraint(equalTo: self.topAnchor),
            self.moreDetails.leadingAnchor.constraint(equalTo: self.stackView.trailingAnchor),
            self.moreDetails.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.moreDetails.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            

        ])
    }
    
    @objc
    func didTapMoreDetail() {
        print("More Detail")
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // Deshabilita la interacción de la celda cuando se toca el botón
        let hitView = super.hitTest(point, with: event)
         if hitView == moreDetails {
             self.isUserInteractionEnabled = false
         }
         return hitView
        
    }
}
