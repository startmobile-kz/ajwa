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
        collectionView.register(
            HolidayCell.self,
            forCellWithReuseIdentifier: HolidayCell.reuseID
        )
        collectionView.backgroundColor = .clear
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
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
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
        
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 20,
            bottom: 0,
            trailing: 20
        )
        
        // Section
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 16
        
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
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: HolidayCell.reuseID,
            for: indexPath
        ) as? HolidayCell else {
            fatalError("Could not cast to HolidayCell.")
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate methods

extension HolidaysViewController: UICollectionViewDelegate {
    
}
