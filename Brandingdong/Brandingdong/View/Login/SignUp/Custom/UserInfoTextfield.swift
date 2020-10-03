//
//  UserInfoTextfield.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/26.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserInfoTextfield: UITextField {
  
  // MARK: - Property
  
  private let paddingView = UIView()
  
  // MARK: - Init View
  
  init (placeholder : String) {
    super.init(frame: .zero)
    
    setPaddingView()
    setUI()
    
    attributedPlaceholder = NSAttributedString(
      string: placeholder,
      attributes: [.font : UIFont(name: "AppleSDGothicNeo-regular", size: 14)!,
                   .foregroundColor : UIColor.lightGray])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Setup Layout
  
  private func setPaddingView() {
    let padding: CGFloat = 16
    
    paddingView.snp.makeConstraints {
      $0.width.height.equalTo(padding)
    }
  }
  
  private func setUI() {
    leftView = paddingView
    leftViewMode = .always
    
    layer.borderWidth = 1
    layer.borderColor = UIColor.lightGray.cgColor
    layer.cornerRadius = 10
    clipsToBounds = true
    
    autocapitalizationType = .none
  }
}

