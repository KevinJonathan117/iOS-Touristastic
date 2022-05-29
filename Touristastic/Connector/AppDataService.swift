//
//  AppDataService.swift
//  Touristastic
//
//  Created by Kevin Jonathan on 29/05/22.
//

import Foundation

protocol DataService {
    func getPlaces(completion: @escaping ([Place]) -> Void)
}

class AppDataService: DataService {
    func getPlaces(completion: @escaping ([Place]) -> Void) {
        let url = URL(string: "https://tourism-api.dicoding.dev/list")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let session = URLSession.shared
        let task = session.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error)
            } else if let data = data {
                let places = try! JSONDecoder().decode(PlaceList.self, from: data)
                DispatchQueue.main.async {
                    completion(places.places ?? [])
                }
            } else {
                print("Unexpected Error")
            }
        }
        task.resume()
    }
}
