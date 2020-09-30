//
//  MypageMyShoppingCollectionViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/30.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MypageMyShoppingCollectionViewCell: UICollectionViewCell {
  // MARK: - Property
  
  static let identifier = "MypageMyShoppingCollectionViewCell"
  
  let imageView = UIImageView()
  let titleLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    return lb
  }()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    [imageView,
     titleLabel].forEach {
      contentView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    let imageSize: CGFloat = 32
    let padding: CGFloat = 8
    
    [imageView,
     titleLabel].forEach {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(contentView.snp.centerY)
      }
     }
    
    imageView.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(padding)
      $0.width.height.equalTo(imageSize)
    }
    
    titleLabel.snp.makeConstraints {
      $0.leading.equalTo(imageView.snp.trailing).offset(padding)
    }
  }
  
  // MARK: - configure
  
  func configure(image: UIImage, title: String) {
    imageView.image = image
    titleLabel.text = title
  }
}
