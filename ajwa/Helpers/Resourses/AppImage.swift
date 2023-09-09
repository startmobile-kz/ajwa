import UIKit

protocol AppImageProtocol {
    var rawValue: String { get }
}

extension AppImageProtocol {

    var uiImage: UIImage? {
        guard let image = UIImage(named: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
    var systemImage: UIImage? {
        guard let image = UIImage(systemName: rawValue) else {
            fatalError("Could not find image with name \(rawValue)")
        }
        return image
    }
    
}

enum AppImage: String, AppImageProtocol {
    case picture
    case Disclosure
    case modify
    case Location
    case Rate
    case Settings
    case Share
    case edit
    case vector_right
    case solid_book_quran
    case mosque_1
    case mosque_2
    case mosque_icon
    case clock
    case searchTextFieldIcon
    case checkmark
    case leftArrow
    case rightArrow
    case dot
    case speaker_on
    case speaker_off
    case sacred_event
    case compass
    case ellipsis
    case search
    case expand
}
