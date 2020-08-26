//
//  ProductDisplayTableView.swift
//  Brandingdong
//
//  Created by 성단빈 on 2020/08/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductDisplayTableView: UIView {
  // MARK: - Properties
  private let tableView = UITableView()
  
  // MARK: - View LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUI
  private func setUI() {
    [tableView].forEach {
      addSubview($0)
    }
    
    tableView.dataSource = self
    tableView.register(MDPICKBannerTableViewCell.self, forCellReuseIdentifier: MDPICKBannerTableViewCell.identifier)
  }
  
  // MARK: - SetLayout
  private func setLayout() {
    tableView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Action Button
}

// MARK: - Extension

extension ProductDisplayTableView: UITableViewDataSource {
  private enum MDPICKSection: Int, CaseIterable {
    case MDPICKBanner, footerView, goodList
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    <#code#>
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    <#code#>
  }
}

