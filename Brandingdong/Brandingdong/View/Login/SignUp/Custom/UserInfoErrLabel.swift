//
//  UserInfoErrLabel.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/28.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserInfoErrLabel: UILabel {
  
  // MARK: - Init View
  
  init(title: String) {
    super.init(frame: .zero)
    
    text = title
    font = UIFont(name: "AppleSDGothicNeo-regular", size: 10)
    textColor = .systemRed
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
  }
}
