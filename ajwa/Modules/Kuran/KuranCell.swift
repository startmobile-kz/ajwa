
import UIKit
import SnapKit

final class KuranCell: UITableViewCell {
    
    static let identifier = String.init(describing: KuranCell.self)
    
    private let cellContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = AppColor.white.uiColor
        return view
    }()
    
    lazy var kuranIdLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.clipsToBounds = true
        label.textAlignment = .center
        label.backgroundColor = AppColor.blue.uiColor
        label.layer.cornerRadius = 12
        label.font = AppFont.medium.s14()
        return label
    }()
    
    lazy var kuranTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.black.uiColor
        label.numberOfLines = 1
        label.font = AppFont.bold.s14()
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.gray.uiColor
        label.numberOfLines = 0
        label.font = AppFont.regular.s14()
        return label
    }()
    
    private lazy var checkmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "checkmark"), for: .normal)
        return button
    }()
    
    public func configure(with model: Kuran.ModelType.ViewModel) {
        kuranIdLabel.text = model.id
        kuranTitleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierarchy() {
        contentView.addSubview(cellContainer)
        cellContainer.addSubview(kuranIdLabel)
        cellContainer.addSubview(kuranTitleLabel)
        cellContainer.addSubview(descriptionLabel)
        cellContainer.addSubview(checkmarkButton)
    }
    
    private func setupLayout () {
        
        cellContainer.snp.makeConstraints {make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(63)
            make.width.equalTo(350)
            make.centerY.equalToSuperview()
        }
        
        kuranIdLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalToSuperview().offset(12)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        kuranTitleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(12)
            make.leading.equalTo(kuranIdLabel.snp.trailing).offset(16)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(kuranTitleLabel.snp.bottom)
            make.leading.equalTo(kuranTitleLabel.snp.leading)
            make.bottom.equalToSuperview().offset(-12)
        }
        
        checkmarkButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
    }
}
