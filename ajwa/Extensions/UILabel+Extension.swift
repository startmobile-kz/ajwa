import UIKit

extension UILabel {
    func setAttributedText(text: String,
                           attributes: [NSAttributedString.Key : Any]? = nil,
                           value: UIColor? = nil,
                           range: NSRange? = nil) {
        let attributedString = NSMutableAttributedString(string: text,
                                                         attributes: attributes)
        
        guard let value = value else {
            attributedText = attributedString
            return
        }
        
        attributedString.addAttribute(NSAttributedString.Key.foregroundColor,
                                      value: value,
                                      range: range ?? NSRange(..<text.count))
        attributedText = attributedString
    }
}
