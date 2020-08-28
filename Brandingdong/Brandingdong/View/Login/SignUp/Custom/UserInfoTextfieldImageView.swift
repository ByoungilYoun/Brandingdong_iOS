//
//  UserInfoTextfieldImageView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/26.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserInfoTextfieldImageView: UIView {
  // MARK: - Property
  
  private let textfieldImageView = UIImageView()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: .zero)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    textfieldImageView.image = UIImage(systemName: "checkmark")?
      .withTintColor(.systemBlue, renderingMode: .alwaysOriginal)
    self.addSubview(textfieldImageView)
  }
  
  private func setConstraints() {
    
    let itemSize: CGFloat = 16
    
    textfieldImageView.snp.makeConstraints {
      $0.centerY.trailing.equalToSuperview()
      $0.width.height.equalTo(itemSize)
    }
  }
}
