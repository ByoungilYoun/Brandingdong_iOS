//
//  MypageTopView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/29.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MypageTopView: UIView {
  // MARK: - Property
  
  let imageView = UIImageView()
  let titleLabel = UILabel()
  let countLabel = UILabel()
  
  
  // MARK: - Init View
  
  init(image: UIImage, title: String, count: Int) {
    super.init(frame: .zero)
    
    imageView.image = image
    titleLabel.text = title
    countLabel.text = String(count)
    
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    [imageView,
    titleLabel,
    countLabel].forEach {
      self.addSubview($0)
    }
  }
  
  private func setConstraints() {
    let imageSize: CGFloat = 50
    let padding: CGFloat = 8
    
    imageView.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.width.height.equalTo(imageSize)
    }
    
    [titleLabel,
     countLabel].forEach {
      $0.snp.makeConstraints {
        $0.top.equalTo(imageView.snp.bottom).offset(padding)
      }
    }
    
    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.leading)
    }
    
    countLabel.snp.makeConstraints {
      $0.leading.equalTo(titleLabel.snp.trailing).offset(padding)
    }
  }
}
