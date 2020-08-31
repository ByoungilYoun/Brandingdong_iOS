//
//  UserInfoLabel.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserInfoLabel: UILabel {
  
  // MARK: - Init View
  
  init(title: String) {
    super.init(frame: .zero)
    
    text = title
    font = UIFont(name: "AppleSDGothicNeo-regular", size: 16)
    
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
