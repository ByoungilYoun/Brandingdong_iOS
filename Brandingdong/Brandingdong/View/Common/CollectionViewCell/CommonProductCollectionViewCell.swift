//
//  CommonProductCollectionViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/14.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CommonProductCollectionViewCell: UICollectionViewCell {
  // MARK: - Property
  
  let productImageView = UIImageView()
  let sellerNickName: UILabel = {
    let lb = UILabel()
    return lb
  }()
  
  let productTitle: UILabel = {
    let lb = UILabel()
    return lb
  }()
  
  let priceTitle: UILabel = {
    let lb = UILabel()
    return lb
  }()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
    setUI()
    setConstraints()
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    [productImageView,
     sellerNickName,
     productTitle,
     priceTitle].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 8
    
    [sellerNickName]
  }
}
