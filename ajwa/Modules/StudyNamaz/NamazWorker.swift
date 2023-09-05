
import UIKit

final class NamazWorker {
    
    func fetchNamaz()-> [Namaz.ModelType.ViewModel] {
        
        let namaz = [
            Namaz.ModelType.ViewModel(id: "1", title: "Тан намаз", description: "*  2 ракаат суннет    2 ракаат парыз" ),
            Namaz.ModelType.ViewModel(id: "2", title: "Беси намаз", description: "*  2 ракаат суннет    2 ракаат парыз"),
            Namaz.ModelType.ViewModel(id: "3", title: "Екинти", description: "*  2 ракаат суннет    2 ракаат парыз"),
            Namaz.ModelType.ViewModel(id: "4", title: "Акшам", description: "*  2 ракаат суннет    2 ракаат парыз"),
            Namaz.ModelType.ViewModel(id: "5", title: "Куптан ", description: "*  2 ракаат суннет    2 ракаат парыз") ]
        
        return namaz
    }
}
