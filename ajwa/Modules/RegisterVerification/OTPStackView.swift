import UIKit
import SnapKit

protocol OTPDelegate: AnyObject {
    func didChangeValidity(isValid: Bool)
}

final class OTPStackView: UIStackView {
    
    // MARK: - Properties
    
    var numberOfFields: Int = 4 {
        didSet {
            addTextFields()
        }
    }
    
    var otpText: String {
        var text = ""
        allTextFields.forEach { textField in
            text += textField.text ?? ""
        }
        return text
    }
    
    var allTextFields: [OTPTextField] = []
    weak var delegate: OTPDelegate?
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        addTextFields()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Setup
    
    private func setupView() {
        backgroundColor = .clear
        axis = .horizontal
        isUserInteractionEnabled = true
        translatesAutoresizingMaskIntoConstraints = false
        contentMode = .center
        distribution = .fillEqually
    }
    
    private func addTextFields() {
        removeAllSubviews()
        
        let range = 0..<numberOfFields
        range.forEach { index in
            let textField = OTPTextField()
            setupTextField(textField)
            allTextFields.append(textField)
            textField.previousTextField = index != 0 ? allTextFields[index-1] : nil
            index != 0 ? allTextFields[index-1].nextTextField = textField : ()
        }
        
        allTextFields[0].becomeFirstResponder()
    }
    
    private func setupTextField(_ textField: OTPTextField) {
        textField.delegate = self
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = AppColor.white.uiColor
        textField.textAlignment = .center
        textField.adjustsFontSizeToFitWidth = false
        textField.font = AppFont.regular.s24()
        textField.attributedPlaceholder = NSAttributedString(string: "_", attributes: [NSAttributedString.Key.foregroundColor: AppColor.black.uiColor])
        textField.textColor = AppColor.black.uiColor
        textField.layer.cornerRadius = 10
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = AppColor.lightGray.cgColor
        textField.keyboardType = .numberPad
        textField.autocorrectionType = .yes
        textField.textContentType = .oneTimeCode
        
        addArrangedSubview(textField)
        
        textField.snp.makeConstraints { make in
            make.top.bottom.equalTo(self)
        }
    }
    
    // MARK: - Methods
    
    private func removeAllSubviews() {
        allTextFields = []
        
        self.subviews.forEach { subview in
            subview.removeFromSuperview()
        }
    }
    
    private func checkForValidity() {
        for textField in allTextFields {
            if textField.text == "" {
                delegate?.didChangeValidity(isValid: false)
                return
            }
            
            delegate?.didChangeValidity(isValid: true)
        }
    }
    
    private func autoFillTextField(with string: String) {
        let textArray = string.reversed().compactMap { String($0) }
        
        zip(textArray, allTextFields).forEach { (text, textField) in
            textField.text = text
        }
        
        checkForValidity()
    }
    
}

// MARK: - Extension

extension OTPStackView: UITextFieldDelegate {    
    func textFieldDidEndEditing(_ textField: UITextField) {
        checkForValidity()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textField = textField as? OTPTextField else { return true }
        
        if string.count > 1 {
            textField.resignFirstResponder()
            autoFillTextField(with: string)
            return false
        }
        
        if range.length == 0 {
            textField.text = string
            textField.nextTextField == nil ? textField.resignFirstResponder() : textField.nextTextField?.becomeFirstResponder()
            return false
        }
        
        return true
    }
}
