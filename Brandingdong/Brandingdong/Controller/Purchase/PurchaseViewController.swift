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
  
  let data : [String] = ["컬러", "사이즈"]
  
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
  
  //MARK: - headerView()
  private func headerView() -> UIView {
    let view = PurchaseTableHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 40))
    view.backgroundColor = .white
    return view
  }
}

  //MARK: - UITableViewDataSource
extension PurchaseViewController : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PurchaseTableViewCell.identifier, for: indexPath) as! PurchaseTableViewCell
    cell.configure(text: data[indexPath.row])
    return cell
  }
}
  //MARK: - UITableViewDelegate
extension PurchaseViewController : UITableViewDelegate {
  
}
