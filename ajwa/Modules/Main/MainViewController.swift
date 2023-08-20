//
//  MainViewController.swift
//  ajwa
//
//  Created by Damir Aliyev on 20.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainDisplayLogic: AnyObject {
    func displaySomething(viewModel: Main.Something.ViewModel)
}

final class MainViewController: UIViewController, MainDisplayLogic {
    
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?
    
    // MARK: - UI
    
    private lazy var headerView: MainHeaderView = {
        let view = MainHeaderView()
        return view
    }()
    
    private lazy var firstMosqueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.mosque_1.uiImage
        return imageView
    }()
    
    private lazy var secondMosqueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = AppImage.mosque_2.uiImage
        return imageView
    }()
    
    private lazy var particularNamazView = ParticularNamazView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        view.backgroundColor = AppColor.background.uiColor
        
        [headerView, firstMosqueImageView, secondMosqueImageView, particularNamazView].forEach {
            view.addSubview($0)
        }
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        headerView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(44)
        }
        
        firstMosqueImageView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(11.35)
            make.leading.equalTo(headerView)
            make.width.equalTo(141.28)
            make.height.equalTo(124.47)
        }
        
        secondMosqueImageView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(11.35)
            make.trailing.equalTo(headerView)
            make.width.equalTo(141.28)
            make.height.equalTo(124.47)
        }
        
        particularNamazView.snp.makeConstraints { make in
            make.top.equalTo(firstMosqueImageView).offset(113.65)
            make.leading.equalTo(headerView)
        }
    }
    
    // MARK: Do something
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    func doSomething() {
        let request = Main.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Main.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
