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
    
    //    MARK: Collection View
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
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
    
    //    MARK: Audio Section
    
    private lazy var backgroundViewForAudio: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 12
        stack.alignment = .center
        return stack
    }()
    
    private lazy var playButton: UIButton = {
        var imageFlag = false
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "play"), for: .normal)
        button.backgroundColor = .white
//        button.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        return button
    }()
    
    private lazy var progressLayer: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 4
        view.backgroundColor = UIColor(red: 0, green: 0.616, blue: 0.749, alpha: 1)
        return view
    }()
    
    private lazy var timerLabel: UILabel = {
        let lable = UILabel()
        lable.text = "1:20"
        lable.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        lable.textAlignment = .center
        lable.font = AppFont.semibold.s12()
        return lable
    }()
    
    //    MARK: Number section
    
    private lazy var backgroundViewForNumber: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var numberLable: UILabel = {
        let lable = UILabel()
        lable.font = AppFont.semibold.s64()
        lable.center = view.center
        lable.sizeToFit()
        lable.text = "1"
        return lable
    }()
    
    //    MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupLayout()
        startVerticalScrollAnimation()
    }
    
    //    MARK: - SetupView
    
    private func setupViews() {
        stackView.addArrangedSubview(playButton)
        stackView.addArrangedSubview(progressLayer)
        stackView.addArrangedSubview(timerLabel)
        view.addSubview(collectionView)
        view.addSubview(backgroundViewForAudio)
        view.addSubview(stackView)
        view.addSubview(backgroundViewForNumber)
        view.addSubview(numberLable)
        view.backgroundColor = UIColor(red: 0.975, green: 0.975, blue: 0.975, alpha: 1)
    }
    
    //    MARK: - SetupLayout
    
    private func setupLayout() {
        collectionView.snp.makeConstraints {
            $0.height.equalTo(382)
            $0.top.equalToSuperview().inset(120)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        backgroundViewForAudio.snp.makeConstraints {
            $0.height.equalTo(48)
            $0.width.equalTo(350)
            $0.top.equalTo(collectionView.snp.bottom).offset(12)
            $0.centerX.equalTo(collectionView)
        }
        
        stackView.snp.makeConstraints{
            $0.width.equalTo(318)
            $0.height.equalTo(24)
            $0.leading.equalTo(backgroundViewForAudio.snp.leading).inset(16)
            $0.top.equalTo(backgroundViewForAudio.snp.top).inset(12)
        }
        
        playButton.snp.makeConstraints {
            $0.width.equalTo(24)
            $0.height.equalTo(24)
        }
        
        progressLayer.snp.makeConstraints {
            $0.width.equalTo(88)
            $0.height.equalTo(6)
        }
        
        timerLabel.snp.makeConstraints{
            $0.width.equalTo(24)
            $0.height.equalTo(10)
        }
        
        backgroundViewForNumber.snp.makeConstraints {
            $0.width.equalTo(74)
            $0.height.equalTo(156)
            $0.top.equalTo(backgroundViewForAudio.snp.bottom).offset(24)
            $0.leading.equalToSuperview().inset(158)
        }
        
        numberLable.snp.makeConstraints {
            $0.centerX.equalTo(backgroundViewForNumber.snp.centerX)
            $0.centerY.equalTo(backgroundViewForNumber.snp.centerY)
            
        }
    }
    
    //    MARK: - Methods
    
    func startVerticalScrollAnimation() {
        let targetNumber = 99 // Целевое число
        let animationDuration: TimeInterval = 5 // Продолжительность анимации (в секундах)
        let animationDelay: TimeInterval = 0.1 // Задержка перед началом анимации (в секундах)

        UIView.animate(withDuration: animationDuration, delay: animationDelay, options: [.curveEaseOut], animations: {
            self.numberLable.alpha = 0.3 // Затухание числа
            self.numberLable.frame.origin.y -= self.backgroundViewForNumber.frame.height // Сдвиг числа вверх
        }) { _ in
            self.numberLable.alpha = 1.0 // Восстановление прозрачности
            self.numberLable.frame.origin.y = self.backgroundViewForNumber.center.y // Возврат числа на исходное место
            self.numberLable.text = "\(targetNumber)" // Обновление числа
            self.numberLable.sizeToFit() // Обновление размера лейбла
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
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(
            layoutSize: itemSize
        )
        // Group
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(330),
                                               heightDimension: .absolute(348))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [layoutItem]
        )
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 12,
                                                            leading: 10,
                                                            bottom: 22,
                                                            trailing: 10)
        
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

        func updateUIViewController(_ uiViewController: MyProvider.ContainerView.UIViewControllerType,
                                    context: UIViewControllerRepresentableContext<MyProvider.ContainerView>) {

        }
    }
}
