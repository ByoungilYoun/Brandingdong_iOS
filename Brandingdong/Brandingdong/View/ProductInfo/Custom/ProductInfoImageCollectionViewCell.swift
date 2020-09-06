//
//  ProductInfoImageCollectionViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/05.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoImageCollectionViewCell: UICollectionViewCell {
  // MARK: - Property
  
  var imageView = UIImageView()
  static let identifier = "ProductInfoImageCollectionViewCell"
  
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
    contentView.addSubview(imageView)
  }
  
  private func setConstraints() {
    imageView.snp.makeConstraints {
      $0.edges.equalTo(contentView)
    }
  }
}
