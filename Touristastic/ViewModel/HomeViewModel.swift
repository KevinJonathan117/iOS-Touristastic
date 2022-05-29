//
//  HomeViewModel.swift
//  Touristastic
//
//  Created by Kevin Jonathan on 29/05/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var places = [Place]()
    
    let dataService: DataService
    
    init(dataService: DataService = AppDataService()) {
        self.dataService = dataService
    }
    
    func getPlaces() {
        dataService.getPlaces { [weak self] places in
            self?.places = places
        }
    }
}
