//
//  PurchaseViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseViewController : UIViewController {
  
  //MARK: - Properties
  private let tableView = UITableView()
  
  private let purchaseCollectionVC = PurchaseCollectionViewController()
  
  struct ExpandableChoices {
    var isExpanded : Bool
    var choices : [Choices]
  }
  
  struct Choices {
    let name : String
    var hasChecked : Bool
  }
  
  var twoChoicesArray = [
    ExpandableChoices(isExpanded: true, choices: ["빨강", "노랑", "검정", "파랑"].map { Choices(name: $0, hasChecked: false)}),
    ExpandableChoices(isExpanded: true, choices: ["S", "M", "L"].map {Choices(name: $0, hasChecked: false)})
  ]
  
  var selectedChoice = [String]()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    addPurchaseCollectionView()
  }
  
  //MARK: - setUI()
  private func setUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(PurchaseTableViewCell.self, forCellReuseIdentifier: PurchaseTableViewCell.identifier)
    tableView.tableHeaderView = self.headerView()
    tableView.tableFooterView = UIView()
    view.addSubview(tableView)
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  //MARK: - addPurchaseCollectionView()
  private func addPurchaseCollectionView() {
    addChild(purchaseCollectionVC)
    view.addSubview(purchaseCollectionVC.view)
    purchaseCollectionVC.view.alpha = 0
    purchaseCollectionVC.view.isHidden = true
    purchaseCollectionVC.view.backgroundColor = .systemBackground
    purchaseCollectionVC.didMove(toParent: self)

    purchaseCollectionVC.view.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalTo(tableView)
    }
  }
  
  //MARK: - customDelegate method
  func someThingIWantToCall(cell : UITableViewCell) {
    guard let indexPathTapped = tableView.indexPath(for: cell) else { return }
    
    let choice = twoChoicesArray[indexPathTapped.section].choices[indexPathTapped.row]
    
    let hasChecked = choice.hasChecked
    twoChoicesArray[indexPathTapped.section].choices[indexPathTapped.row].hasChecked = !hasChecked
    
    tableView.reloadRows(at: [indexPathTapped], with: .fade)
    
     if hasChecked == false {
      selectedChoice.append(choice.name)
     } else {
      selectedChoice.removeLast()
     }
    
    if selectedChoice.count == 2 {
      purchaseCollectionVC.view.alpha = 1
      purchaseCollectionVC.view.isHidden = false
    }
  }
  
  //MARK: - headerView()
  private func headerView() -> UIView {
    let view = PurchaseTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
    view.backgroundColor = .white
    return view
  }
  
  @objc func buttonClicked(button : UIButton) {
    let section = button.tag
    var indexPaths = [IndexPath]()
    
    for row in twoChoicesArray[section].choices.indices {
      let indexPath = IndexPath(row: row, section: section)
      indexPaths.append(indexPath)
    }
    
    let isExpanded = twoChoicesArray[section].isExpanded
    twoChoicesArray[section].isExpanded = !isExpanded
    
    button.setImage(isExpanded ? UIImage(systemName: "chevron.down") : UIImage(systemName: "chevron.up"), for: .normal)
    
    if isExpanded {
      tableView.deleteRows(at: indexPaths, with: .fade)
    } else {
      tableView.insertRows(at: indexPaths, with: .fade)
    }
  }
}

  //MARK: - UITableViewDataSource
extension PurchaseViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = PurchaseSectionView()
    view.backgroundColor = .white
    view.clickButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    view.clickButton.tag = section
    switch section {
    case 0:
      view.configure(text: "컬러")
    default:
      view.configure(text: "사이즈")
    }
    return view
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    40
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return twoChoicesArray.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if !twoChoicesArray[section].isExpanded {
      return 0
    }
    return twoChoicesArray[section].choices.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseTableViewCell.identifier, for: indexPath) as! PurchaseTableViewCell
    let choice = twoChoicesArray[indexPath.section].choices[indexPath.row]
    cell.link = self
    cell.textLabel?.text = choice.name

    cell.checkButton.setImage(choice.hasChecked ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle"), for: .normal)
    cell.checkButton.tintColor = choice.hasChecked ? UIColor.red : UIColor.lightGray
    cell.checkButton.tag = indexPath.row
    return cell
  }
}
  //MARK: - UITableViewDelegate
extension PurchaseViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

  }
}
