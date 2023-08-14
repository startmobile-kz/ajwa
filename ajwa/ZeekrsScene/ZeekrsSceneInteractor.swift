//
//  ZeekrsSceneInteractor.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 13.08.2023.
//

import Foundation

protocol ZeekrsBusinessLogic {
    func fetchArticles()
}

class ZeekrsSceneInteractor: ZeekrsBusinessLogic {
    
    var presenter: ZeekrsScenePresentationLogic?
    
    func fetchArticles() {
        presenter?.presentData()
    }
}
