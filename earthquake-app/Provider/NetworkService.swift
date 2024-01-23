//
//  Network.swift
//  earthquake-app
//
//  Created by Alvaro Concha on 21-01-24.
//

import Foundation

import Alamofire

class NetworkService {
    static let shared = NetworkService()
    static let url: String = "https://earthquake.usgs.gov/fdsnws/event/1/"
    static let urlQuery: String =  "https://earthquake.usgs.gov/fdsnws/event/1/query?format=geojson&orderby=time&limit=10"
    

    private init() {}

    func fetchData(completion: @escaping (Result<EarthQuake, Error>) -> Void) {
        AF.request(NetworkService.urlQuery).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let earthQuake = try decoder.decode(EarthQuake.self, from: data)
                    completion(.success(earthQuake))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
