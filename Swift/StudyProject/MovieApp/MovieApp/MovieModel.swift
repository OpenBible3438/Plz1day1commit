//
//  MovieModel.swift
//  MovieApp
//
//  Created by 편성경 on 2022/06/23.
//

import Foundation

struct MovieModel: Codable {
    let resultCount: Int
    let results: [MovieResult] // struct Result를 담는 Array
}

struct MovieResult: Codable {
    let trackName: String
    let previewUrl: String
    let image: String
    let shortDescription: String?
    let longDescription: String
    let trackPrice: Double
    let currency: String
    let releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case image = "artworkUrl100"
        case trackName
        case previewUrl
        case shortDescription
        case longDescription
        case trackPrice
        case currency
        case releaseDate
    }
}
