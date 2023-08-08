//
//  DhikrDetailsViewController.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 08.08.2023.
//

import UIKit
import SnapKit

final class DhikrDetailsViewController: UIViewController {
    
    //    MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .red
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setupViews()
        setupLayout()
        
    }
    
    //    MARK: - SetupView
    
    private func setupViews() {
        view.addSubview(collectionView)
    }
    
    //    MARK: - SetupLayout
    
    private func setupLayout() {
        
        collectionView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.height.equalTo(382)
            $0.top.equalToSuperview().offset(120)
            $0.leading.trailing.equalToSuperview().offset(20)
        }
    }
}
//    MARK: - UICollectionView DataSource methods

extension DhikrDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return DhikrDetailsCollectionViewCell()
    }
    
    
}

//    MARK: - UICollectionView Delegate methods

extension DhikrDetailsViewController: UICollectionViewDelegate {
    
}
