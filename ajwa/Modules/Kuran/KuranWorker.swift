
import UIKit

final class KuranWorker {
    
    func fetchKuran()-> [Kuran.ModelType.ViewModel] {
        
        let kuran = [
            Kuran.ModelType.ViewModel(id: "1", title: "Аль-Фатиха", description: "(Открывающая куран)" ),
            Kuran.ModelType.ViewModel(id: "2", title: "Аль-Бакара", description: "(Корова)"),
            Kuran.ModelType.ViewModel(id: "3", title: "Алю Имран", description: "(Семейство Имрана)"),
            Kuran.ModelType.ViewModel(id: "4", title: "Алю Имран", description: "(Семейство Имрана)"),
            Kuran.ModelType.ViewModel(id: "5", title: "Алю Имран", description: "(Семейство Имрана)"),
            Kuran.ModelType.ViewModel(id: "6", title: "Алю Имран", description: "(Семейство Имрана)"),
            Kuran.ModelType.ViewModel(id: "7", title: "Алю Имран", description: "(Семейство Имрана)"),
            Kuran.ModelType.ViewModel(id: "8", title: "Алю Имран", description: "(Семейство Имрана)")
        ]
        return kuran
    }
}
