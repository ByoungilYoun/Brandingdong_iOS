//
//  HeaderCollectionReusableView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/05.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView : UICollectionReusableView {
  
  //MARK: - Properties
  static let identifier = "HeaderCollectionReusableView"
  let imageView = UIImageView()
  let titleLabel = UILabel()
  private let totalButton = SelectAllCustomButton()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    addSubview(imageView)
    imageView.snp.makeConstraints {
      $0.leading.equalTo(self).offset(5)
      $0.centerY.equalTo(self)
      $0.width.height.equalTo(50)
    }
    
    addSubview(titleLabel)
    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing)
      $0.centerY.equalTo(self)
    }
    
    addSubview(totalButton)
    totalButton.snp.makeConstraints {
      $0.trailing.equalTo(self).offset(-30)
      $0.centerY.equalTo(self)
      $0.width.height.equalTo(20)
    }
  }
  
  func configure(image : String, title : String) {
    imageView.image = UIImage(named: image)
    titleLabel.text = title
  }
}
