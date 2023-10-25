//
//  LocationWorker.swift
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
import CoreLocation

final class LocationWorker {

    
        

    func fetchCards(completion: @escaping (Location.ModelType.ViewModel?) -> Void) {
        
        
        if let url = Bundle.main.url(forResource: "states", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Location.ModelType.ViewModel.self, from: data)
                completion(jsonData)
            } catch {
                print("error:\(error)")
                completion(nil)
            }
        }
    
}
    
    func fetchLocation() -> [Location.ModelType.ViewModel] {
        
        let countries = NSLocale.isoCountryCodes.map { (code:String) -> String in
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            return NSLocale(localeIdentifier: "en_US").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
        }
        

//
        
        
//        let text = try! String(contentsOfFile: Bundle.main.path(forResource: "states", ofType: "json")!) // Reading File
//        let lineArray = text.components(separatedBy: "\n") // Separating Lines
//
//                for eachLA in lineArray
//                {
//                    let wordArray = eachLA.components(separatedBy: ",")
//                    // wordArray[0] is city , [1] is country and so on
//                }
        
            
        
//        let location
        
//       working code
        let location = [
           
            
           
            Location.ModelType.ViewModel(country: "Kazakhstan", states: ["Atyrau", "Almaty", "Astana"], isExpanded: false),
            Location.ModelType.ViewModel(country: "Turkey", states: ["Istanbul", "Bodrum", "Antalya"], isExpanded: false)
        
        ]
                                                                          
                           
        return location
        
    }
}