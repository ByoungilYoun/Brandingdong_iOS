//
//  CategoryViewCustomCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/05.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CategoryViewCustomCell : UICollectionViewCell {
  
  //MARK: - Properties
  static let identifier = "CategoryViewCustomCell"
  
  var titleLabel = UILabel()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setUI() {
    contentView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(10)
      $0.centerX.centerY.equalToSuperview()
    }
  }
  
  func configure(data : String) {
    if data == "SALE" {
      titleLabel.textColor = .red
      titleLabel.font = UIFont.boldSystemFont(ofSize: 14)
    }
    titleLabel.text = data
    titleLabel.font = UIFont.systemFont(ofSize: 14)
  }
}
