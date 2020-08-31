//
//  DividerView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/08/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DividerView : UIView {
  
  //MARK: - Properties
  
  let divdier = UIView()
  
  //MARK: -  init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setCosntratins()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    divdier.backgroundColor = UIColor.black.withAlphaComponent(0.8)
    addSubview(divdier)
    
  }
  private func setCosntratins() {
    divdier.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(self).offset(5)
      $0.trailing.equalTo(self).offset(-5)
      $0.height.equalTo(1.0)
    }
  }
}
