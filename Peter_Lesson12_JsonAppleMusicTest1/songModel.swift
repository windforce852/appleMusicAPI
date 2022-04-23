//
//  songModel.swift
//  Peter_Lesson12_JsonAppleMusicTest1
//
//  Created by Kwan Ho Leung on 21/4/2022.
//

import Foundation

struct musicApiResponse: Codable{
    let results: [musicApiItems]
}

struct musicApiItems: Codable{
    let artistName: String
    let trackName: String
    let collectionName: String
    let artworkUrl100: URL
    let collectionPrice: Int
}
