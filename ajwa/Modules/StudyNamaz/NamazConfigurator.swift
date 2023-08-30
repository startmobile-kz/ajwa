
import UIKit

final class NamazConfigurator {
    
    static let shared = NamazConfigurator()
    
    func configure(viewController: NamazViewController) {
        let interactor = NamazInteractor()
        let presenter = NamazPresenter()
        let router = NamazRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}
