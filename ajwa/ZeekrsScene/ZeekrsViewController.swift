//
//  ZeekrsViewController.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 10.08.2023.
//

import UIKit

protocol ZeekrsSceneDisplayLogic: class {
    func displayData()
}

class ZeekrsViewController: UIViewController, ZeekrsSceneDisplayLogic {
    
    func displayData() {
        
    }
    
    private var interactor: ZeekrsBusinessLogic?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    private func setup() {
        let viewController = self
        let presenter = ZeekrsScenePresenter()
        let interactor = ZeekrsSceneInteractor()
        interactor.presenter = presenter
        presenter.viewController = viewController
        viewController.interactor = interactor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var dataToDisplay: [String] = [] 
    var names: [String] = []
    var filteredNames: [String] = []
    var isFiltered = false
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Поиск"
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.rightViewMode = .always
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "searchTextFieldIcon")
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
        tableView.backgroundColor = #colorLiteral(red: 0.9764706492, green: 0.9764706492, blue: 0.9764706492, alpha: 1)
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupConstraints()
        
        names = ["adlet","beka","daulet","islam","bauka","temir","tilek","aisaule","kuka"]
        
        
        interactor?.fetchArticles()
    }
    
    private func setupViews() {
        title = "Зикры"
        view.backgroundColor = #colorLiteral(red: 0.9764706492, green: 0.9764706492, blue: 0.9764706492, alpha: 1)
        view.addSubview(searchTextField)
        view.addSubview(tableView)
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupConstraints() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
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

extension ZeekrsViewController: UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text {
            filterText(text + string)
        }
        
        if string.isEmpty {
            filteredNames = []
            print("aa")
            isFiltered = false
            tableView.reloadData()
        }
        
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
        cell.backgroundColor = #colorLiteral(red: 0.9764706492, green: 0.9764706492, blue: 0.9764706492, alpha: 1)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

