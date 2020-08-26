//
//  CustomTextField.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/08/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CustomTextField : UITextField {

  //MARK: - init
  init(placeholder : String) {
    super.init(frame : .zero)
    
    let spacer = UIView()
    leftView = spacer
    leftViewMode = .always
    leftView?.snp.makeConstraints {
      $0.height.equalTo(40)
      $0.width.equalTo(12)
    }
    
    borderStyle = .roundedRect
    textColor = .black
    attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [.foregroundColor : UIColor.lightGray])
    self.snp.makeConstraints {
      $0.height.equalTo(40)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
