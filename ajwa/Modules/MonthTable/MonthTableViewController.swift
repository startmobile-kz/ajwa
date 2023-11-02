//
//  MonthTableViewController.swift
//  ajwa
//
//  Created by Adlet Zhantassov on 28.08.2023.
//  Copyright (c) 2023 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MonthTableDisplayLogic: AnyObject {
    func updateInterface(data: [MonthSection: [ResultModel]])
}

final class MonthTableViewController: UIViewController, MonthTableDisplayLogic {
    
  //MARK: - Properties
    
  var interactor: MonthTableBusinessLogic?
  var router: (NSObjectProtocol & MonthTableRoutingLogic & MonthTableDataPassing)?
    
  private let currentDate = Date.getCurrentDate()
  private let currentMonthDays = Date.getDaysInMonth()
  private var currentMonth = Date.getCurrentMonth()
  private let currentMonthTitle = Date.getCurrentMonthTitle()
  var data: ZeekrModel?
  var transformedData: [MonthSection: [ResultModel]] = [:]
  var dataTopView = ["Январь", "Февраль", "Март","Апрель","Май","Июнь","Июль","Август","Сентябрь","Октябрь","Ноябрь","Декабрь"]
  lazy var index = Date.getCurrentMonth() - 1
    
  //MARK: - Outlets
    
  private let topView = TopView()
  private lazy var tableView = makeTableView()
  
  // MARK: Init
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(currentMonth)
    setupView()
    setupConstraints()
    viewLoaded()
  }
    
  //MARK: - Methods
    
    func updateInterface(data: [MonthSection: [ResultModel]]) {
        self.transformedData = data
        self.tableView.reloadData()
    }
    
    private func viewLoaded() {
      interactor?.loadData()
    }
    
    @objc func leftArrowButtonPressed() {
        if index > 0 {
            index -= 1
            topView.label.text = dataTopView[index]
            currentMonth -= 1
            tableView.reloadData()
        }
        print("left arrow \(index)")
    }
    
    @objc func rightArrowButtonPressed() {
        if index < (dataTopView.count - 1) {
            index += 1
            topView.label.text = dataTopView[index]
            currentMonth += 1
            tableView.reloadData()
        }
        print("right arrow \(index)")
    }
    
    private func setupView() {
        title = "Таблица на месяц"
        topView.label.text = dataTopView[currentMonth-1]
        view.backgroundColor = AppColor.background.uiColor
        view.addSubview(topView)
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(topView.snp.bottom).offset(10)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-20)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView()
         tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
         tableView.register(MonthTableViewCell.self, forCellReuseIdentifier: MonthTableViewCell.identifier)
         tableView.register(DatesMonthTableViewCell.self, forCellReuseIdentifier: DatesMonthTableViewCell.identifier)
         tableView.delegate = self
         tableView.dataSource = self
         tableView.backgroundColor = AppColor.background.uiColor
         tableView.separatorStyle = .none
         tableView.showsHorizontalScrollIndicator = false
         tableView.showsVerticalScrollIndicator = false
         return tableView
    }
}

//MARK: - UITableViewDelegate

extension MonthTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - UITableViewDataSource

extension MonthTableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (currentMonthDays + 1)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: MonthTableViewCell.identifier, for: indexPath) as? MonthTableViewCell else { return UITableViewCell() }
            return cell
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DatesMonthTableViewCell.identifier, for: indexPath) as? DatesMonthTableViewCell else { return UITableViewCell() }
        
        if currentMonth == 1 {
            if let model = transformedData[.january]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 2 {
            if let model = transformedData[.february]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 3 {
            if let model = transformedData[.march]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 4 {
            if let model = transformedData[.april]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 5 {
            if let model = transformedData[.may]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 6 {
            if let model = transformedData[.june]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 7 {
            if let model = transformedData[.july]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 8 {
            if let model = transformedData[.august]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 9 {
            if let model = transformedData[.september]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 10 {
            if let model = transformedData[.october]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 11 {
            if let model = transformedData[.november]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        } else if currentMonth == 12 {
            if let model = transformedData[.december]?[indexPath.row - 1] {
                cell.configure(index: indexPath.row, model: model)
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
