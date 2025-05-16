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
    
    static func fetchLeaguesDetails(sportType:String,leaguesKey:String,completionHandler:@escaping(Any?)-> Void )
    
    
}

class NetworkService : NetworkSProtocol{
    
    static var result : LeaguesResponse?
    static var leaguesDetailsResult : LeaguesDetailsResponse?
    
    static func fetchLeaguesDetails(sportType: String, leaguesKey: String, completionHandler: @escaping (Any?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/\(sportType)/"
        let urlParameters: [String: Any] = [
            "APIkey": "d563ff5053b8ffebbaa19a688960166cb280a840b535413bad65ba3f0c0b662c",
            "met": "Fixtures",
            "from": "2024-08-01",
            "to": "2025-06-30",
//            "from": "2025-04-25",
//         "to": "2025-06-1",
            "leagueId": leaguesKey
        ]
        
        AF.request(url, method: .get, parameters: urlParameters, encoding: URLEncoding.default)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    if let jsonString = String(data: data, encoding: .utf8) {
                                   print("Response JSON: \(jsonString)")
                               }
                    do {
                        switch sportType {
                        case "football":
                            let decoded = try JSONDecoder().decode(LeaguesDetailsResponse.self, from: data)
                            completionHandler(decoded)
                        case "cricket":
                            let decoded = try JSONDecoder().decode(CricketResponse.self, from: data)
                            completionHandler(decoded)
                        case "basketball":
                            let decoded = try JSONDecoder().decode(BasketballResponse.self, from: data)
                            completionHandler(decoded)
                        default:
                            print("Unsupported sportType")
                            completionHandler(nil)
                        }
                    } catch {
                        print("Decoding failed: \(error)")
                        completionHandler(nil)
                    }
                case .failure(let error):
                    print("Network failed: \(error)")
                    completionHandler(nil)
                }
            }
    }




    
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
    

    
    
}
