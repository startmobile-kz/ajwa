//
//  ZeekrView.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 22.10.2023.
//

import UIKit

class ZeekrView: UIView {
    
    var dataToDisplay: [String] = []
    var names: [String] = []
    var filteredNames: [String] = []
    var isFiltered = false
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Поиск"
        textField.backgroundColor = AppColor.white.uiColor
        textField.rightViewMode = .always
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = AppImage.searchTextField.uiImage
        textField.rightView = imageView
        textField.delegate = self
        textField.layer.cornerRadius = 16
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.white.cgColor
        return textField
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(ZeekrsTableViewCell.self, forCellReuseIdentifier: ZeekrsTableViewCell.identifier)
        tableView.backgroundColor = AppColor.background.uiColor
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
        
        names = ["adlet","beka","daulet","islam","bauka","temir","tilek","aisaule","kuka"]
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = AppColor.background.uiColor
        addSubview(searchTextField)
        addSubview(tableView)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIView.endEditing))
        addGestureRecognizer(tapGesture)
    }
    
    private func setupConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(snp.leading).offset(20)
            make.trailing.equalTo(snp.trailing).offset(-20)
            make.height.equalTo(52)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}

extension ZeekrView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

extension ZeekrView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        if !filteredNames.isEmpty {
        return filteredNames.count
      }
        
        return isFiltered ? 0 : names.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ZeekrsTableViewCell.identifier, for: indexPath) as? ZeekrsTableViewCell else { return UITableViewCell() }
        cell.backgroundColor = AppColor.background.uiColor
        cell.idLabel.text = "\(indexPath.row + 1)"
        cell.selectionStyle = .none
        if !filteredNames.isEmpty {
            cell.titleLabel.text = filteredNames[indexPath.row]
        } else {
            cell.titleLabel.text = names[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
}

extension ZeekrView: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            filterText(text + string)
        }
        
        if string.isEmpty {
            filteredNames = []
            isFiltered = false
            tableView.reloadData()
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func filterText(_ query: String) {
        filteredNames = []
        for name in names {
            if name.lowercased().starts(with: query.lowercased()) {
                filteredNames.append(name)
            }
        }
        tableView.reloadData()
        isFiltered = true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
}
