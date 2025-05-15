//
//  NetworkService.swift
//  Sports
//
//  Created by Macos on 13/05/2025.
//

import Foundation
import Alamofire
protocol NetworkSProtocol{
    static func fetchSports(sportType:String,completionHandler:@escaping(LeaguesResponse?)-> Void )
}
class NetworkService : NetworkSProtocol{
    static var result : LeaguesResponse?

    static func fetchSports(sportType:String,completionHandler: @escaping (LeaguesResponse?) -> Void) {
        let allLeaguesUrl = "https://apiv2.allsportsapi.com/\(sportType)/"
        let allLeaguesParameters: [String: Any] = [
            "APIkey": "d563ff5053b8ffebbaa19a688960166cb280a840b535413bad65ba3f0c0b662c",
            "met": "Leagues",
        ]

        AF.request(allLeaguesUrl, method: .get, parameters: allLeaguesParameters, encoding: URLEncoding.default) 
            .responseDecodable(of: LeaguesResponse.self) { response in
                switch response.result {
                case .success(let leagues):
                    completionHandler(leagues)
                    print("Leagues fetched successfully")
                case .failure(let error):
                    completionHandler(nil)
                    print("Error fetching leagues: \(error)")
                }
            }
    }
    
//    static func fetchDataFromJSON(completionHandler: @escaping (ProductsResult?) -> Void) {
//        let url = URL(string: "https://dummyjson.com/products")
//        guard let newURL = url else {return}
//        let request = URLRequest(url: newURL)
//        let task = URLSession.shared.dataTask(with: request){ data, response , error in
//            guard let data = data else {return}
//            do{
//                result = try JSONDecoder().decode(ProductsResult.self, from: data)
//                completionHandler(result)
//            }
//            catch{
//                completionHandler(nil)
//            }
//        }.resume()
//    }
    
    
}
