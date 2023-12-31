//
//  ZeekrInteractor.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 22.10.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import Foundation

protocol ZeekrBusinessLogic
{
  func fetchArticles()
}

protocol ZeekrDataStore
{
  //var name: String { get set }
}

class ZeekrInteractor: ZeekrBusinessLogic, ZeekrDataStore
{
  var presenter: ZeekrPresentationLogic?
  var worker: ZeekrWorker?
  //var name: String = ""
  
  // MARK: Do something
    
  func fetchArticles() {
    guard let url = URL(string: "https://api.muftyat.kz/prayer-times/2022/51.133333/71.433333?format=json") else { fatalError("Invalid URL") }
    
    NetworkManager.shared.getRequest(fromURL: url) { (result: Result<ZeekrModel, Error>) in
        switch result {
        case .success(let data):
            print(data)
        case .failure(let error):
            print("we got error description: \(error.localizedDescription)")
        }
    }
  }
  
}
