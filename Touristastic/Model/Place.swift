//
//  Place.swift
//  Touristastic
//
//  Created by Kevin Jonathan on 29/05/22.
//

import Foundation

struct PlaceList: Decodable {
    let places: [Place]?
    let error: Bool?
    let message: String?
    let count: Int?
}

struct Place: Identifiable, Decodable {
    let id: Int?
    let name: String?
    let description: String?
    let address: String?
    let longitude: Double?
    let latitude: Double?
    let like: Int?
    let image: String?
}
