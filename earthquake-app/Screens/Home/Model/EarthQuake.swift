//
//  EarthQuake.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 11-01-24.
//

import Foundation

struct EarthQuake: Codable {
    
    let type: String
    let metadata: Metadata
    let features: [Feature]
    let bbox: [Double]
    
    // MARK: - Metadata
    struct Metadata: Codable {
        let generated: Int
        let url: String
        let title: String
        let status: Int
        let api: String
        let limit, offset, count: Int
    }
    
    // MARK: - Feature
    struct Feature: Codable {
        let type: String
        let properties: Properties
        let geometry: Geometry
        let id: String
        
        // MARK: - Properties
        struct Properties: Codable {
            let mag: Double
            let place: String
            let time, updated: Int
            let tz: Int?
            let url, detail: String
            let felt, cdi, mmi, alert: Int?
            let status: String
            let tsunami, sig: Int
            let net, code, ids, sources: String
            let types: String
            let nst, dmin: Int?
            let rms: Double
            let gap: Int?
            let magType, type, title: String
        }
        
        // MARK: - Geometry
        struct Geometry: Codable {
            let type: String
            let coordinates: [Double]
        }
    }
}
