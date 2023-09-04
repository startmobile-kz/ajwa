
import UIKit

protocol NamazBusinessLogic {
    func getNamazList()
}

protocol NamazDataStore { }

final class NamazInteractor: NamazBusinessLogic, NamazDataStore {
    
    var presenter: NamazPresentationLogic?
    var worker: NamazWorker?
    var namaz = [Namaz.ModelType.ViewModel]()
    
    // MARK: Do something
    
    func getNamazList() {
        worker = NamazWorker()
        
        self.presenter?.presentSomething(response: worker?.fetchNamaz() ?? [])
    }
}




