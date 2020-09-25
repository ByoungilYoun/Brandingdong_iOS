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
  
  struct ExpandableChoices {
    var isExpanded : Bool
    var choices : [String]
  }
  
  var twoChoicesArray = [
    ExpandableChoices(isExpanded: false, choices: ["빨강", "노랑", "검정", "파랑"]),
    ExpandableChoices(isExpanded: false, choices: ["S", "M", "L"])
  ]
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
  }
  
  //MARK: - setUI()
  private func setUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    let name = twoChoicesArray[indexPath.section].choices[indexPath.row]
    cell.textLabel?.text = name
    return cell
  }
}
  //MARK: - UITableViewDelegate
extension PurchaseViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
