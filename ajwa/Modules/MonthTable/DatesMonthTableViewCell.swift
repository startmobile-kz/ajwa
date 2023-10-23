//
//  DatesMonthTableViewCell.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 29.08.2023.
//

import UIKit

class DatesMonthTableViewCell: UITableViewCell {
    
    static let identifier = "DatesMonthTableViewCell"
    
    lazy var mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.backgroundColor = AppColor.white.uiColor
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    var rowNumber = UILabel(text: "", font: .systemFont(ofSize: 12), textColor: .black)
    var label1 = UILabel(text: "", font: .systemFont(ofSize: 12), textColor: .black)
    var label2 = UILabel(text: "", font: .systemFont(ofSize: 12), textColor: .black)
    var label3 = UILabel(text: "", font: .systemFont(ofSize: 12), textColor: .black)
    var label4 = UILabel(text: "", font: .systemFont(ofSize: 12), textColor: .black)
    var label5 = UILabel(text: "", font: .systemFont(ofSize: 12), textColor: .black)
    var label6 = UILabel(text: "", font: .systemFont(ofSize: 12), textColor: .black)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = AppColor.background.uiColor
        
        addSubview(mainView)
        mainView.addSubview(stackView)
        stackView.addArrangedSubview(rowNumber)
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
            make.leading.equalTo(mainView.snp.leading).offset(10)
            make.trailing.equalTo(mainView.snp.trailing).offset(-10)
            make.bottom.equalTo(mainView.snp.bottom)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        rowNumber.text = nil
//        label1.text = nil
//        label2.text = nil
//        label3.text = nil
//        label4.text = nil
//        label5.text = nil
//        label6.text = nil
//    }
    
    func configure(index: Int, model: ResultModel) {
        rowNumber.text = "\(index)"
        label1.text = model.fajr
        label2.text = model.sunrise
        label3.text = model.dhuhr
        label4.text = model.asr
        label5.text = model.maghrib
        label6.text = model.isha
    }
    
}
