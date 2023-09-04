//
//  ZeekrsScenePresenter.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 13.08.2023.
//

import Foundation

protocol ZeekrsScenePresentationLogic {
    func presentData()
}

final class ZeekrsScenePresenter: ZeekrsScenePresentationLogic {
    
    weak var viewController: ZeekrsSceneDisplayLogic?
    
    func presentData() {
        
    }
}
