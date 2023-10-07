import UIKit

protocol KuranPresentationLogic {
    func presentSomething(response: [Kuran.ModelType.ViewModel])
}

final class KuranPresenter: KuranPresentationLogic {
    weak var viewController: KuranDisplayLogic?

    func presentSomething(response: [Kuran.ModelType.ViewModel]) {
        viewController?.displayKuran(viewModel: response)
    }
}
