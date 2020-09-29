//
//  PurchaseSectionView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseSectionView : UIView {
  
  //MARK: - Properties
  var titleLabel : UILabel = {
   var lb = UILabel()
   lb.font = UIFont.boldSystemFont(ofSize: 14)
   lb.textColor = .lightGray
   lb.textAlignment = .left
   return lb
 }()
  
  var clickButton : UIButton = {
    var bt = UIButton()
    bt.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    bt.tintColor = .black
    return bt
  }()
  
  private let lineView : UIView = {
    let line = UIView()
    line.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    return line
  }()
  
   var selectedLabel : UILabel = {
    var lb = UILabel()
    lb.font = UIFont.boldSystemFont(ofSize: 20)
    lb.textColor = .black
    lb.text = ""
    lb.textAlignment = .left
    return lb
  }()
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: .zero)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - configureUI()
  private func configureUI() {
    [titleLabel, selectedLabel, clickButton, lineView].forEach {
      self.addSubview($0)
    }
    
    titleLabel.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(self).offset(15)
    }
    
    selectedLabel.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(titleLabel.snp.trailing).offset(5)
    }
    
    clickButton.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.trailing.equalTo(self).offset(-15)
    }
    
    lineView.snp.makeConstraints {
      $0.leading.trailing.equalTo(self)
      $0.bottom.equalTo(self)
      $0.height.equalTo(0.5)
    }
  }
  
  //MARK: - configure
  func configure(text : String) {
    titleLabel.text = text
  }
  
  func configureSelectedLabel(text : String) {
    selectedLabel.text = text
  }
}
