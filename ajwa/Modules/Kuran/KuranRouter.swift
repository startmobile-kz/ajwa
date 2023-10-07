
import UIKit

@objc protocol KuranRoutingLogic { }

protocol KuranDataPassing {
    var dataStore: KuranDataStore? { get }
}

final class KuranRouter: NSObject, KuranRoutingLogic, KuranDataPassing {
    weak var viewController: KuranViewController?
    var dataStore: KuranDataStore?
}
