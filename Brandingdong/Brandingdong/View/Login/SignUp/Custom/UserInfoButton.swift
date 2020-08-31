//
//  UserInfoButton.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserInfoButton: UIButton {
  // MARK: - Init View
  
  init(title: String) {
    super.init(frame: .zero)
    setTitle(title, for: .normal)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    backgroundColor = .systemGray
    setTitleColor(.white, for: .normal)
    layer.cornerRadius = 10
    clipsToBounds = true
    isEnabled = false
  }
}
