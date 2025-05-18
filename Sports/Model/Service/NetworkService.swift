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
    
  static func fetchPlayers(sportType:String,teamName:String, completionHandler:@escaping(TeamPlayersResponse?)-> Void )
    
    
}

class NetworkService : NetworkSProtocol{
    static func fetchPlayers(sportType: String,teamName:String , completionHandler: @escaping (TeamPlayersResponse?) -> Void) {
        let allPlayersURL = "https://apiv2.allsportsapi.com/\(sportType)/"
        let allPlayersParameters: [String: Any] = [
            "APIkey": "d563ff5053b8ffebbaa19a688960166cb280a840b535413bad65ba3f0c0b662c",
            "met": "Players",
            "teamName": teamName
        ]
        //print("Final URL: \(allPlayersURL)?\(allPlayersParameters)")
        AF.request(allPlayersURL, method: .get, parameters: allPlayersParameters, encoding: URLEncoding.default)
            .responseDecodable(of: TeamPlayersResponse.self) { response in
                switch response.result {
                case .success(let players):
                    completionHandler(players)
                    print("Leagues fetched successfully")
                case .failure(let error):
                    completionHandler(nil)
                    print("Error fetching leagues: \(error)")
                }
            }
    }
    
    
    static var result : LeaguesResponse?
    static var leaguesDetailsResult : LeaguesDetailsResponse?
    
    static func fetchLeaguesDetails(sportType: String, leaguesKey: String, completionHandler: @escaping (Any?) -> Void) {
        let url = "https://apiv2.allsportsapi.com/\(sportType)/"
        let urlParameters: [String: Any] = [
            "APIkey": "d563ff5053b8ffebbaa19a688960166cb280a840b535413bad65ba3f0c0b662c",
            "met": "Fixtures",
            "from": "2024-08-01",
            "to": "2025-08-30",
            
//            "from": "2025-05-1",
//         "to": "2025-05-3",
            
//            "from": "2025-05-01",
//                   "to": "2025-05-30",
            
            "leagueId": leaguesKey
        ]
        
        AF.request(url, method: .get, parameters: urlParameters, encoding: URLEncoding.default)
            .responseData { response in
                switch response.result {
                case .success(let data):
//                    if let jsonString = String(data: data, encoding: .utf8) {
//                                   print("Response JSON: \(jsonString)")
//                               }
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
                            
                        case "tennis":
                            let decoded = try JSONDecoder().decode(TennisResponse.self, from: data)
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
        print("Final URL: \(allLeaguesUrl)?\(allLeaguesParameters)")
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
