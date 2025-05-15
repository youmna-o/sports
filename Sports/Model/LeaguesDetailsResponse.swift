//
//  LeaguesDetailsResponse.swift
//  Sports
//
//  Created by Macos on 15/05/2025.
//

import Foundation
struct LeaguesDetailsResponse: Codable {
    let success: Int?
    let result: [LeaguesDetails]?
}
