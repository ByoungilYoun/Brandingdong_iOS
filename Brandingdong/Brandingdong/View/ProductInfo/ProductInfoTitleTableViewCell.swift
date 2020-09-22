//
//  ProductInfoTitleView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/05.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoTitleTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "ProductInfoTitleTableViewCell"
  
  private let sellerImageView = UIImageView()
  
  private let sellerNickName: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
    lb.textColor = .lightGray
    lb.text = "사용자 닉네임"
    return lb
  }()
  
  private let productTitle: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 24)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "상품명"
    return lb
  }()

  
  private let productPrice: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 20)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "xx,xxx"
    return lb
  }()
  
  private let buyCountTitle: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    lb.textColor = .lightGray
    lb.text = "xx개 구매중"
    return lb
  }()
  
  // MARK: - Cell init
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    productTitleInit()
    setUI()
    setConstraints()
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [sellerImageView,
     sellerNickName,
     productTitle,
     productPrice,
//     buyCountTitle
    ].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let imageSize: CGFloat = 52
    let sellerMargin: CGFloat = 16
    let margin: CGFloat = 8
    
    [sellerImageView,
     productTitle,
     productPrice,
//     buyCountTitle
    ].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(margin)
      }
    }
    
    sellerImageView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(sellerMargin)
      $0.width.height.equalTo(imageSize)
    }
    
    sellerNickName.snp.makeConstraints {
      $0.leading.equalTo(sellerImageView.snp.trailing).offset(margin)
      $0.centerY.equalTo(sellerImageView.snp.centerY)
    }
    
    productTitle.snp.makeConstraints {
      $0.top.equalTo(sellerImageView.snp.bottom).offset(sellerMargin)
    }
    
    productPrice.snp.makeConstraints {
      $0.top.equalTo(productTitle.snp.bottom).offset(margin)
    }
    
    sellerImageView.clipsToBounds = true
    sellerImageView.layer.cornerRadius = imageSize / 2
  }
  
  private func productTitleInit() {
    sellerNickName.text = ProductInfo.checkProductBrandName
    productTitle.text = ProductInfo.checkProductName
    productPrice.text = ProductInfo.checkProductPrice
    
    let url = URL(string: ProductInfo.checkProductBrandImage)
    let data = try! Data(contentsOf: url!)
    sellerImageView.image = UIImage(data: data)
  }
}
