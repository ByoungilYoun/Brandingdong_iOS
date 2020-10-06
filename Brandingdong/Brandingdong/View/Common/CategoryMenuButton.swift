//
//  CategoryMenuButton.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/05.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CategoryMenuButton: UIButton {
  
  // MARK: - Init View
  
  init(title: String) {
    super.init(frame: .zero)
    
    setTitle(title, for: .normal)
    setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
