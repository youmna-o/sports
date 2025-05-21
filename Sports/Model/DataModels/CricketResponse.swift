//
//  CricketResponse.swift
//  Sports
//
//  Created by Macos on 16/05/2025.
//

import Foundation
struct CricketResponse: Codable {
    let success: Int?
    let result: [CricketMatchDetails]?
}
