//
//  UserinfoEntryTableView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserinfoEntryTableView: UIView {
  // MARK: - Property
  
  private let userInfoTableView = UITableView()
  private let userInfoEntryView = UserInfoEntryView()
  private let viewHeight = UIScreen.main.bounds.height
  
  lazy var userInfoViewArr = [userInfoEntryView]
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    setTableView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    self.addSubview(userInfoTableView)
  }
  
  private func setConstraints() {
    userInfoTableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    userInfoTableView.allowsSelection = false
    userInfoTableView.dataSource = self
    userInfoTableView.register(UserInfoEntryTableViewCell.self, forCellReuseIdentifier: UserInfoEntryTableViewCell.identifier)
  }
}

// MARK: - UITableViewDataSource

extension UserinfoEntryTableView: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userInfoViewArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let userInfoCell = userInfoTableView.dequeueReusableCell(withIdentifier: UserInfoEntryTableViewCell.identifier, for: indexPath) as! UserInfoEntryTableViewCell
    userInfoCell.userInfoView = userInfoViewArr[indexPath.row]
    
    switch indexPath.row {
    case 0:
      userInfoTableView.rowHeight = viewHeight
    default:
      break
    }
    return userInfoCell
  }
}
