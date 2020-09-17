//
//  BrandViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/13.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class BrandView: UIView {
  
  //MARK: - Properties
  private let tableView = UITableView()
  
  //MARK: - LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    self.backgroundColor = .systemBackground
    tableView.dataSource = self
    tableView.delegate = self
    tableView.allowsSelection = false
    tableView.register(BrandFirstTableViewCell.self, forCellReuseIdentifier: BrandFirstTableViewCell.identifier)
    tableView.register(BrandSecondTableViewCell.self, forCellReuseIdentifier: BrandSecondTableViewCell.identifier)
    tableView.register(ThirdTableViewCell.self, forCellReuseIdentifier: ThirdTableViewCell.identifier)
    addSubview(tableView)
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
}

  //MARK: - UITableViewDataSource
extension BrandView : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: BrandFirstTableViewCell.identifier, for: indexPath) as! BrandFirstTableViewCell
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: BrandSecondTableViewCell.identifier, for: indexPath) as! BrandSecondTableViewCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: ThirdTableViewCell.identifier, for: indexPath)
      return cell
    }
  }
}

  //MARK: - UITableViewDelegate
extension BrandView : UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      return self.frame.size.height / 1.5
    } else if indexPath.section == 1 {
      return 5920
    } else {
      return 600
    }
  }
}
