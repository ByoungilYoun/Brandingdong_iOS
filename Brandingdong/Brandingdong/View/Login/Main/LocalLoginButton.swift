//
//  LocalLoginButton.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/08/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class LocalLoginButton : UIButton {
  
  init(title : String, color : UIColor) {
    super.init(frame: .zero)
    
    setTitle(title, for: .normal)
    backgroundColor = color
    layer.cornerRadius = 10
    setTitleColor(.white, for: .normal)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
