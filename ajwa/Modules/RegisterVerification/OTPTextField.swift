import UIKit

final class OTPTextField: UITextField {
    
    // MARK: - Properties
    
    weak var previousTextField: OTPTextField?
    weak var nextTextField: OTPTextField?
    
    // MARK: - Override
    
    override public func deleteBackward() {
        text = ""
        previousTextField?.becomeFirstResponder()
    }
}
