//
//  SearchTextfieldImageView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SearchTextfieldImageView: UIView {
  // MARK: - Property
  
  private let textfieldImageView = UIImageView()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    textfieldImageView.image = UIImage(systemName: "magnifyingglass")?
      .withTintColor(.lightGray, renderingMode: .alwaysOriginal)
    self.addSubview(textfieldImageView)
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 10
    
    textfieldImageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(padding)
      $0.trailing.equalToSuperview().offset(-padding)
    }
  }
}
