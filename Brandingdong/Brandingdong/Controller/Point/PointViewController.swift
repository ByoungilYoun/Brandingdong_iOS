//
//  PointViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/01.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PointViewController: UIViewController {
  
  // MARK: - Property
  
  private let deviceHeight = UIScreen.main.bounds.height
  private let tableView = UITableView()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    setTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [tableView].forEach {
      view.addSubview($0)
    }
  }
  
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    
    tableView.register(PointTopTableViewCell.self,
                       forCellReuseIdentifier: PointTopTableViewCell.identifier)
    
    tableView.register(PointMiddleTableViewCell.self,
                       forCellReuseIdentifier: PointMiddleTableViewCell.identifier)
    
    tableView.register(PointBottonTableViewCell.self,
                       forCellReuseIdentifier: PointBottonTableViewCell.identifier)
  }
  
  // MARK: - NavigationBar
  
  private func setNavi() {
    
    navigationController?.navigationBar.isHidden = false
    
    navigationItem.title = "포인트"
    
    let leftDismissButton = UIBarButtonItem(
      image: UIImage(systemName: "chevron.left"),
      style: .plain,
      target: self,
      action: #selector(didTapDismissButton))
    
    leftDismissButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.layoutIfNeeded()
  }
  
  @objc func didTapDismissButton() {
    navigationController?.popViewController(animated: true)
  }
}

// MARK: - UITableViewDataSource

extension PointViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return 1
    case 2:
      return 1
    default:
      break
    }
    return Int()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: PointTopTableViewCell.identifier,
                                               for: indexPath) as! PointTopTableViewCell
      tableView.rowHeight = 72
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: PointMiddleTableViewCell.identifier,
                                               for: indexPath) as! PointMiddleTableViewCell
      tableView.rowHeight = 112
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: PointBottonTableViewCell.identifier,
                                               for: indexPath) as! PointBottonTableViewCell
      tableView.rowHeight = deviceHeight - (72 + 102)
      return cell
    default:
      break
    }
    return UITableViewCell()
  }
}

// MARK: -

extension PointViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return tableView.tableFooterView
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 10
  }
}
