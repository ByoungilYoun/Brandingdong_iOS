//
//  OrderViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/03.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class OrderViewController : UIViewController {
  
  //MARK: - Properties
  private let tableView = UITableView()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  //MARK: - setNavi()
  private func setNavi() {
    navigationController?.navigationBar.isHidden = false
    title = "주문하기"
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(moveBack))
    navigationItem.leftBarButtonItem?.tintColor = .black
  }
  
  //MARK: - setUI()
  private func setUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CustomerInfoCell.self, forCellReuseIdentifier: CustomerInfoCell.identifier)
    tableView.register(LocationInfoCell.self, forCellReuseIdentifier: LocationInfoCell.identifier)
    tableView.register(DeliveryRequireCell.self, forCellReuseIdentifier: DeliveryRequireCell.identifier)
    tableView.allowsSelection = false
    tableView.tableFooterView = UIView()
    view.addSubview(tableView)
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  //MARK: - @objc func
  @objc private func moveBack() {
    navigationController?.popViewController(animated: true)
  }
}

  //MARK: - UITableViewDataSource
extension OrderViewController : UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 5
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: CustomerInfoCell.identifier, for: indexPath) as! CustomerInfoCell
      tableView.rowHeight = 250
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: LocationInfoCell.identifier, for: indexPath) as! LocationInfoCell
      tableView.rowHeight = 150
      return cell
    } else if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryRequireCell.identifier, for: indexPath) as! DeliveryRequireCell
      tableView.rowHeight = 120
      return cell
    } else {
      return UITableViewCell()
    }
  }
  
  
}

  //MARK: - UITableViewDelegate
extension OrderViewController : UITableViewDelegate {
  
}