//
//  ProductPageView.swift
//  Brandingdong
//
//  Created by 성단빈 on 2020/08/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductDisplayPageView: UIView {
  // MARK: - Properties
  private let displayPageCollectionView = UICollectionView()
  
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
    [displayPageCollectionView].forEach {
      self.addSubview($0)
    }
  }
  
  // MARK: - SetLayout
  private func setLayout() {
    displayPageCollectionView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Action Button
}

// MARK: - Extension

