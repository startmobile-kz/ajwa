
import UIKit

protocol KuranBusinessLogic {
    func getKuranList()
}

protocol KuranDataStore { }

final class KuranInteractor: KuranBusinessLogic, KuranDataStore {
    
    var presenter: KuranPresentationLogic?
    var worker: KuranWorker?
    var kuran = [Kuran.ModelType.ViewModel]()
        
    func getKuranList() {
        worker = KuranWorker()
        
        self.presenter?.presentSomething(response: worker?.fetchKuran() ?? [])
    }
}




