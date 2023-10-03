//
//  HolidaysInteractor.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

protocol HolidaysBusinessLogic {
    func doSomething(request: Holidays.Something.Request)
}

protocol HolidaysDataStore {

}

final class HolidaysInteractor: HolidaysBusinessLogic, HolidaysDataStore {
    
    var presenter: HolidaysPresentationLogic?
    var worker: HolidaysWorker?
    
    // MARK: Do something
    
    func doSomething(request: Holidays.Something.Request) {
        worker = HolidaysWorker()
        worker?.doSomeWork()
        
        let response = Holidays.Something.Response()
        presenter?.presentSomething(response: response)
    }
}
