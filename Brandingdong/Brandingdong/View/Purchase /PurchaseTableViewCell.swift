//
//  PurchaseTableViewCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseTableViewCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "PurchaseTableViewCell"
  
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
  
  //MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    [titleLabel, clickButton].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    titleLabel.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(self).offset(15)
    }
    
    clickButton.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.trailing.equalTo(self).offset(-15)
    }
  }
  
  func configure(text : String) {
    titleLabel.text = text
  }
}
