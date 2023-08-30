
import UIKit

protocol NamazPresentationLogic {
    func presentSomething(response: [Namaz.ModelType.ViewModel])
}

final class NamazPresenter: NamazPresentationLogic {
    weak var viewController: NamazDisplayLogic?
    
    // MARK: Do something
    
    func presentSomething(response: [Namaz.ModelType.ViewModel]) {
        viewController?.displayPrayer(viewModel: response)
    }
}
