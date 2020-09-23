//
//  PurchaseTableHeaderView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseTableHeaderView : UIView {
  
  //MARK: - Properties
  private let optionLabel : UILabel = {
    let lb = UILabel()
    lb.text = "옵션"
    lb.textAlignment = .left
    lb.font = UIFont.boldSystemFont(ofSize: 20)
    lb.textColor = .black
    return lb
  }()
  
  private let lineView : UIView = {
    let line = UIView()
    line.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    return line
  }()
  //MARK: - init
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .red
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    self.addSubview(optionLabel)
    
    optionLabel.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(self).offset(15)
    }
    
    self.addSubview(lineView)
    
    lineView.snp.makeConstraints {
      $0.leading.trailing.equalTo(self)
      $0.bottom.equalTo(self)
      $0.height.equalTo(0.5)
      
    }
  }
}
