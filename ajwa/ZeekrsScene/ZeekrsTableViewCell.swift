//
//  ZeekrsTableViewCell.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 11.08.2023.
//

import UIKit

final class ZeekrsTableViewCell: UITableViewCell {
    
    static let identifier = String(describing: ZeekrsTableViewCell.self)
    
    //MARK: - UI
    lazy var idLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.white.uiColor
        label.text = "1"
        label.clipsToBounds = true
        label.textAlignment = .center
        label.backgroundColor = AppColor.blue.uiColor
        label.layer.cornerRadius = 12
        label.font = .systemFont(ofSize: 15)
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 14, weight: .bold)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = AppColor.text.uiColor
        label.numberOfLines = 0
        label.text = "asdasdaklsmdaknsdkanklsdnalksdnaknsdkamsd;lam;lsdmaasdasdaklsmdaknsdkanklsdnalksdnaknsdkamsd;lam;asdasdaklsmdaknsdkanklsdnalksdnaknsdkamsd;lam;asdasdaklsmdaknsdkanklsdnalksdnaknsdkamsd;lam;asdasdaklsmdaknsdkanklsdnalksdnaknsdkamsd;lam;asdasdaklsmdaknsdkanklsdnalksdnaknsdkamsd;lam;"
        label.font = .systemFont(ofSize: 12)
        return label
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.backgroundColor = AppColor.white.uiColor
        view.layer.cornerRadius = 15
        return view
    }()
    
    private lazy var checkmarkButton: UIButton = {
        let button = UIButton()
        button.setImage(AppImage.checkmark.uiImage, for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        addSubview(mainView)
        mainView.addSubview(idLabel)
        mainView.addSubview(titleLabel)
        mainView.addSubview(descriptionLabel)
        mainView.addSubview(checkmarkButton)
    }
        
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        idLabel.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top).offset(15)
            make.leading.equalTo(mainView.snp.leading).offset(15)
            make.width.equalTo(30)
            make.height.equalTo(30)
        }
        
        checkmarkButton.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top).offset(15)
            make.trailing.equalTo(mainView.snp.trailing).offset(-10)
            make.height.equalTo(24)
            make.width.equalTo(30)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(15)
            make.leading.equalTo(idLabel.snp.trailing).offset(15)
            make.trailing.equalTo(checkmarkButton.snp.leading).offset(-5)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.leading.equalTo(titleLabel.snp.leading)
            make.trailing.equalTo(titleLabel.snp.trailing)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
