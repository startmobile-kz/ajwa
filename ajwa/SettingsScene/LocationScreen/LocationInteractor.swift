//
//  LocationInteractor.swift
//  ajwa
//
//  Created by Aisaule Sibatova on 23.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol LocationBusinessLogic {
    var isLoading: Bool { get }

    func getNextBatchOfCities()
}

protocol LocationDataStore {}

final class LocationInteractor: LocationBusinessLogic, LocationDataStore {
    
    var presenter: LocationPresentationLogic?
    var citiesViewModels = [Location.ModelType.ViewModel]()
    var currentPage: Int = 0
    var isLoading: Bool = false
    let worker = CitiesWorker()
    
    // MARK: - Public methods

    func getNextBatchOfCities() {
        currentPage += 1
        fetchCities(currentPage)
    }

    // MARK: - Private methods

    private func fetchCities(_ page: Int) {
        isLoading = true

        worker.fetchCities(for: currentPage) { [weak self] response in
            guard let self = self else { return }

            self.isLoading = false

            let nextBatchOfCitiesViewModels = response.results.map {
                Location.ModelType.ViewModel(cityTitle: $0.title, utcTimezone: "UTC +0\($0.timezone):00")
            }
            self.citiesViewModels.append(contentsOf: nextBatchOfCitiesViewModels)
            self.presenter?.presentLocation(response: citiesViewModels)
        }
    }
}
