import UIKit
import SnapKit

protocol RegisterVerificationViewProtocol: AnyObject {
    
}

final class RegisterVerificationViewController: UIViewController {
    
    // MARK: - Properties
    
    private var timeRemaining: Int = 59
    private var timer: Timer?
    
    // MARK: - Outlets
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = AppFont.regular.s20()
        label.textColor = AppColor.black.uiColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = AppFont.regular.s16()
        label.textColor = AppColor.black.uiColor
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = AppFont.regular.s12()
        label.textColor = AppColor.gray.uiColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = AppFont.semibold.s14()
        label.textColor = AppColor.blue.uiColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var editPhoneButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.edit.uiImage, for: .normal)
        button.layer.cornerRadius = 50
        button.addTarget(self, action: #selector(editPhoneDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var phoneView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.celeste.uiColor
        view.layer.cornerRadius = 5
        return view
    }()
    
    private lazy var otpStackView: OTPStackView = {
        let stackView = OTPStackView()
        stackView.numberOfFields = 4
        stackView.spacing = 20
        stackView.delegate = self
        return stackView
    }()
    
    private lazy var smsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = AppFont.regular.s14()
        label.textColor = AppColor.darkGray.uiColor
        label.textColor = .black
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = timeRemaining.time
        label.textAlignment = .center
        label.font = AppFont.regular.s16()
        label.textColor = AppColor.blue.uiColor
        label.backgroundColor = AppColor.celeste.uiColor
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    private lazy var resendButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = AppFont.regular.s16()
        button.setTitleColor(AppColor.darkGray.uiColor, for: .normal)
        button.backgroundColor = AppColor.celeste.uiColor
        button.isEnabled = false
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        return button
    }()
    
    private lazy var horizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [timeLabel, resendButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = AppFont.medium.s18()
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = AppColor.blue.uiColor
        button.setTitleColor(AppColor.white.uiColor, for: .normal)
        button.layer.cornerRadius = 22
        button.addTarget(self, action: #selector(continueDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHierarchy()
        setupLayout()
        
        applyLocalization()
        startTimer()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        timer = nil
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }
    
    override var shouldAutorotate: Bool {
        false
    }
    
    // MARK: - Deinitialization
    
    deinit {
        print("deinited: \(self)")
    }
    
    // MARK: - Setup
    
    private func setupView() {
        view.backgroundColor = AppColor.white.uiColor
    }
    
    private func setupHierarchy() {
        view.addSubview(containerView)
        
        [phoneLabel, numberLabel, editPhoneButton].forEach { subview in
            phoneView.addSubview(subview)
        }
        
        [titleLabel, descriptionLabel, phoneView, otpStackView, smsLabel, horizontalStackView, continueButton].forEach { subview in
            containerView.addSubview(subview)
        }
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(47)
            make.leading.equalTo(view).offset(20)
            make.centerX.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(containerView)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(containerView)
        }
        
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneView).offset(15)
            make.leading.equalTo(phoneView).offset(10)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(5)
            make.bottom.equalTo(phoneView).offset(-10)
            make.leading.equalTo(phoneView).offset(10)
        }
        
        editPhoneButton.snp.makeConstraints { make in
            make.centerY.equalTo(phoneView)
            make.leading.equalTo(numberLabel.snp.trailing).offset(20)
            make.trailing.equalTo(phoneView).offset(-10)
            make.width.height.equalTo(40)
        }
        
        phoneView.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
        }
        
        otpStackView.snp.makeConstraints { make in
            make.top.equalTo(phoneView.snp.bottom).offset(50)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(70)
        }
        
        smsLabel.snp.makeConstraints { make in
            make.top.equalTo(otpStackView.snp.bottom).offset(30)
            make.leading.trailing.equalTo(containerView)
        }
        
        horizontalStackView.snp.makeConstraints { make in
            make.top.equalTo(smsLabel.snp.bottom).offset(10)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(40)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.width.equalTo(100)
        }
        
        continueButton.snp.makeConstraints { make in
            make.bottom.equalTo(containerView)
            make.leading.trailing.equalTo(containerView)
            make.height.equalTo(55)
        }
    }
    
    // MARK: - Methods

    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(updateTime),
                                     userInfo: nil,
                                     repeats: true)
        resendButton.isEnabled = false
        resendButton.setTitleColor(AppColor.darkGray.uiColor, for: .normal)
    }
    
    @objc private func updateTime() {
        if timeRemaining >= 0 {
            timeLabel.text = timeRemaining.time
            timeRemaining -= 1
            return
        }
        
        timer?.invalidate()
        resendButton.isEnabled = true
        resendButton.setTitleColor(AppColor.black.uiColor, for: .normal)
    }
    
    @objc private func resetTimer() {
        timeRemaining = 59
        startTimer()
    }
    
    @objc private func continueDidTap(_ sender: UIButton) {
        
    }
    
    @objc private func editPhoneDidTap(_ sender: UIButton) {
        
    }
}

// MARK: - Extension

extension RegisterVerificationViewController {
    private func applyLocalization() {
        titleLabel.text = "Код подтверждения"
        descriptionLabel.setAttributedText(text: "На ваш телефон пришел смс с кодом подтверждения и паролем от аккаунта.",
                                           value: AppColor.gray.uiColor,
                                           range: NSRange(location: 0, length: 25))
        smsLabel.setAttributedText(text: "Не пришло смс?",
                                   value: AppColor.darkGray.uiColor)
        phoneLabel.text = "Телефон:"
        numberLabel.text = "+ 7 707 188 18 34"
        resendButton.setTitle("Переотправить", for: .normal)
        continueButton.setTitle("Продолжить", for: .normal)
    }
}

extension RegisterVerificationViewController: OTPDelegate {
    func didChangeValidity(isValid: Bool) {
        print("\(otpStackView.otpText): \(isValid)")
    }
}
