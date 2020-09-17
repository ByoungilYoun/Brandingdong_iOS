//
//  FirstCollectionViewCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/15.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FirstCollectionViewCell : UICollectionViewCell {
  
  //MARK: - Properties
  static let identifier = "FirstCollectionViewCell"
  
  var imageView = UIImageView()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    contentView.addSubview(imageView)
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  func configure(name : String) {
    imageView.image = UIImage(named: name)
  }
}
