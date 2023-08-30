//
//  MonthTableViewCell.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 28.08.2023.
//

import UIKit

class MonthTableViewCell: UITableViewCell {
    
    static let identifier = "MonthTableViewCell"
    
    private lazy var mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = AppColor.blue.uiColor
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var dotImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dot")
        return imageView
    }()
    
    var label1 = UILabel(text: "ФАН.", font: .systemFont(ofSize: 12), textColor: .white)
    var label2 = UILabel(text: "ВОС.", font: .systemFont(ofSize: 12), textColor: .white)
    var label3 = UILabel(text: "ЗУХР", font: .systemFont(ofSize: 12), textColor: .white)
    var label4 = UILabel(text: "АСР", font: .systemFont(ofSize: 12), textColor: .white)
    var label5 = UILabel(text: "МАГ.", font: .systemFont(ofSize: 12), textColor: .white)
    var label6 = UILabel(text: "ИША", font: .systemFont(ofSize: 12), textColor: .white)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = AppColor.background.uiColor
        
        addSubview(mainView)
        mainView.addSubview(stackView)
        stackView.addArrangedSubview(dotImageView)
        stackView.addArrangedSubview(label1)
        stackView.addArrangedSubview(label2)
        stackView.addArrangedSubview(label3)
        stackView.addArrangedSubview(label4)
        stackView.addArrangedSubview(label5)
        stackView.addArrangedSubview(label6)
        
        mainView.snp.makeConstraints { make in
            make.top.equalTo(snp.top).offset(5)
            make.leading.equalTo(snp.leading).offset(5)
            make.trailing.equalTo(snp.trailing).offset(-5)
            make.bottom.equalTo(snp.bottom).offset(-5)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(mainView.snp.top)
            make.leading.equalTo(mainView.snp.leading)
            make.trailing.equalTo(mainView.snp.trailing)
            make.bottom.equalTo(mainView.snp.bottom)
        }
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
