import UIKit

final class TopView: UIView {
    
    //MARK: - Properties
    
    var data = ["Январь", "Февраль", "Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь"]
    var index = 5
    
    //MARK: - Outlets
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = data[index]
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let leftArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.leftArrow.uiImage, for: .normal)
        button.addTarget(nil, action: Selector(("leftArrowButtonPressed")), for: .touchUpInside)
        return button
    }()
    
    private let rightArrowButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(AppImage.rightArrow.uiImage, for: .normal)
        button.addTarget(nil, action: Selector(("rightArrowButtonPressed")), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Init
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    
    private func setupView() {
        addSubview(label)
        addSubview(leftArrowButton)
        addSubview(rightArrowButton)
        backgroundColor = .white
        layer.cornerRadius = 15
    }
    
    private func setupConstraints() {
        leftArrowButton.snp.makeConstraints { make in
            make.leading.equalTo(snp.leading).offset(10)
            make.centerY.equalTo(snp.centerY)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY)
        }
        
        rightArrowButton.snp.makeConstraints { make in
            make.trailing.equalTo(snp.trailing).offset(-10)
            make.centerY.equalTo(snp.centerY)
        }
    }
}
