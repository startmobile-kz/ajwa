
import UIKit

final class KuranConfigurator {
    
    static let shared = KuranConfigurator()
    
    func configure(viewController: KuranViewController) {
        let interactor = KuranInteractor()
        let presenter = KuranPresenter()
        let router = KuranRouter()
        
        viewController.interactor = interactor
        viewController.router = router
        
        interactor.presenter = presenter
        presenter.viewController = viewController
        
        router.viewController = viewController
        router.dataStore = interactor
    }
}
