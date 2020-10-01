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
    
    tableView.register(PointTopTableViewCell.self,
                       forCellReuseIdentifier: PointTopTableViewCell.identifier)
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

extension PointViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: PointTopTableViewCell.identifier,
                                               for: indexPath)
      tableView.rowHeight = 72
      return cell
    default:
      break
    }
    return UITableViewCell()
  }
}
