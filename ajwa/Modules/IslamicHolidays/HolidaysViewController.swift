//
//  HolidaysViewController.swift
//  ajwa
//
//  Created by Damir Aliyev on 06.09.2023.
//

import UIKit

protocol HolidaysDisplayLogic: AnyObject {
    func displaySomething(viewModel: Holidays.Something.ViewModel)
}

final class HolidaysViewController: UIViewController, HolidaysDisplayLogic {
    
    var interactor: HolidaysBusinessLogic?
    var router: (NSObjectProtocol & HolidaysRoutingLogic & HolidaysDataPassing)?
    
    // MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
    }
    
    // MARK: - SetupViews
    
    private func setupViews() {
        view.backgroundColor = AppColor.background.uiColor
        
        view.addSubview(collectionView)
    }
    
    // MARK: - SetupConstraints
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview()
        }
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        // Item
        
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
        )
        
        // Group
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(126)
            ),
            subitems: [item]
        )
        
        // Section
        
        let section = NSCollectionLayoutSection(group: group)
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    // MARK: Do something
    
    func doSomething() {
        let request = Holidays.Something.Request()
        interactor?.doSomething(request: request)
    }
    
    func displaySomething(viewModel: Holidays.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}


// MARK: - UICollectionViewDataSource methods

extension HolidaysViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}

// MARK: - UICollectionViewDelegate methods

extension HolidaysViewController: UICollectionViewDelegate {
    
}
