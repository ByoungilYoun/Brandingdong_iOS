//
//  BannerTableViewCell.swift
//  Brandingdong
//
//  Created by 성단빈 on 2020/08/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MDPICKBannerTableViewCell: UITableViewCell {
  // MARK: - Properties
  static let identifier = "MDPICKBannerTableViewCell"
  private let topBannerImageView = UIImageView()
  private let pageBannerCollectionView = UICollectionView()
  
  // MARK: - View LifeCycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUI
  private func setUI() {
    [topBannerImageView, pageBannerCollectionView].forEach {
      contentView.addSubview($0)
    }
  }
  
  // MARK: - SetLayout
  private func setLayout() {
    topBannerImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    
    pageBannerCollectionView.snp.makeConstraints {
      $0.top.equalTo(topBannerImageView.snp.bottom).offset(8)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Action Button
}

// MARK: - Extension


