//
//  MovieModel.swift
//  MovieApp
//
//  Created by 편성경 on 2022/06/23.
//

import Foundation

struct MovieModel: Codable {
    let resultCount: Int
    let results: [Result] // struct Result를 담는 Array
}

struct Result: Codable {
    let trackName: String
    let previewUrl: String
    let artworkUrl100: String
}
