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

enum MainPageFigmaSizes {
    static let figmaScreenWidth: CGFloat = 390
    static let mosqueImageViewFigmaWidth: CGFloat = 141
    static let particularNamazViewFigmaWidth: CGFloat = 170
    static let remainingTimeViewFigmaWidth: CGFloat = 170
    static let allPrayersViewFigmaWidth: CGFloat = 168
}

final class MainViewController: UIViewController, MainDisplayLogic {
    
    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic & MainDataPassing)?
    
    // MARK: - UI
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private lazy var contentView = UIView()
    
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
    
    private lazy var remainingTimeView = RemainingTimeView()
    
    private lazy var allPrayersView = AllPrayersView()
    
    private lazy var bottomView = MainBottomView()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        view.backgroundColor = AppColor.background.uiColor
        
        [headerView, firstMosqueImageView, secondMosqueImageView, particularNamazView, remainingTimeView, allPrayersView, bottomView].forEach {
            contentView.addSubview($0)
        }
        
        scrollView.addSubview(contentView)
        
        view.addSubview(scrollView)
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        let mosqueImageAdaptivePercentage: CGFloat = MainPageFigmaSizes.mosqueImageViewFigmaWidth / MainPageFigmaSizes.figmaScreenWidth
        let prayerInfoViewsAdaptivePercentage: CGFloat = MainPageFigmaSizes.particularNamazViewFigmaWidth / MainPageFigmaSizes.figmaScreenWidth
        let allPrayersViewAdaptivePercentage: CGFloat = MainPageFigmaSizes.allPrayersViewFigmaWidth / MainPageFigmaSizes.figmaScreenWidth
        
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        headerView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(44)
        }
        
        firstMosqueImageView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(11.35)
            make.leading.equalTo(headerView)
            make.width.equalTo(view.frame.width * mosqueImageAdaptivePercentage)
            make.height.equalTo(124.47)
        }
        
        secondMosqueImageView.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(11.35)
            make.trailing.equalTo(headerView)
            make.width.equalTo(view.frame.width * mosqueImageAdaptivePercentage)
            make.height.equalTo(124.47)
        }
        
        particularNamazView.snp.makeConstraints { make in
            make.top.equalTo(firstMosqueImageView).offset(113.65)
            make.leading.equalTo(headerView)
            make.width.equalTo(view.frame.width * prayerInfoViewsAdaptivePercentage)
            make.height.equalTo(164)
        }
        
        remainingTimeView.snp.makeConstraints { make in
            make.top.equalTo(particularNamazView)
            make.trailing.equalTo(headerView)
            make.width.equalTo(view.frame.width * prayerInfoViewsAdaptivePercentage)
            make.height.equalTo(164)
        }
        
        allPrayersView.snp.makeConstraints { make in
            make.top.equalTo(particularNamazView.snp.bottom).offset(16)
            make.leading.trailing.equalTo(headerView)
            make.height.equalTo(347)
        }
        
        bottomView.snp.makeConstraints { make in
            make.top.equalTo(allPrayersView.snp.bottom).offset(51)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(54)
            make.bottom.equalToSuperview().offset(-29)
        }
    }
    
    func doSomething() {
        let request = Main.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Main.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}

// MARK: - CollectionViewDelegate methods

extension MainViewController: UICollectionViewDelegate {

}

// MARK: - CollectionViewDataSource methods

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SacredEventCell.reuseID, for: indexPath) as? SacredEventCell else {
            fatalError("Could not cast to SacredEventCell")
        }

        return cell
    }
}
