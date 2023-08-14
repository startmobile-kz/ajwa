//
//  DhikrDetailsViewController.swift
//  ajwa
//
//  Created by Темирлан Кудайберген on 08.08.2023.
//

import UIKit
import SnapKit
import SwiftUI

final class DhikrDetailsViewController: UIViewController {
    
    //    MARK: - Properties
    
    let sections = DhikrModel.shared.pageData
    
    //    MARK: - UI
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .white
        collectionView.layer.cornerRadius = 16
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(DhikrDetailsCollectionViewCell.self,
                                forCellWithReuseIdentifier: DhikrDetailsCollectionViewCell.reuseID)
        collectionView.register(DhikrDetailsSectionHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: DhikrDetailsSectionHeader.reuseID)
        return collectionView
    }()
    
    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
    }
    
    //    MARK: - SetupView
    
    private func setupViews() {
        view.addSubview(collectionView)
        view.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
    }
    
    //    MARK: - SetupLayout
    
    private func setupLayout() {
        
        collectionView.snp.makeConstraints {
            $0.width.equalTo(350)
            $0.height.equalTo(382)
            $0.top.equalToSuperview().inset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Section Layouts
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil}
            return self.dhikrSectionLayout()
        }
    }
    
    private func dhikrSectionLayout() -> NSCollectionLayoutSection {
        // Item
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(201),
                                              heightDimension: .absolute(48))
        
        let layoutItem = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        // Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(330),
                                               heightDimension: .absolute(320))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [layoutItem]
        )
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 136,
                                                            leading: 59.5,
                                                            bottom: 136,
                                                            trailing: 59.5)
        
        // Section
        let section = NSCollectionLayoutSection(group: layoutGroup)
        
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 8,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        section.orthogonalScrollingBehavior = .groupPagingCentered
        
        // Header
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .absolute(87),
            heightDimension: .absolute(20)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .topLeading
        )
        section.boundarySupplementaryItems = [layoutSectionHeader]
    
        return section
    }
}
//    MARK: - UICollectionView DataSource methods

extension DhikrDetailsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: DhikrDetailsCollectionViewCell.reuseID,
            for: indexPath
        ) as? DhikrDetailsCollectionViewCell else {
            fatalError("Could not cast to CategoryCollectionViewCell")
        }
        cell.setupData(dhikr: "Dhikr in arabic language")
        cell.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: DhikrDetailsSectionHeader.reuseID,
                                                                         for: indexPath) as! DhikrDetailsSectionHeader
            header.setHeaderTitle(title: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

//    MARK: - UICollectionView Delegate methods

extension DhikrDetailsViewController: UICollectionViewDelegate {
    
}

//    MARK: -  VIEWS IN REAL Time

struct MyProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        func makeUIViewController(context: UIViewControllerRepresentableContext<MyProvider.ContainerView>) -> DhikrDetailsViewController {
            return DhikrDetailsViewController()
        }

        func updateUIViewController(_ uiViewController: MyProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MyProvider.ContainerView>) {

        }
    }
}
