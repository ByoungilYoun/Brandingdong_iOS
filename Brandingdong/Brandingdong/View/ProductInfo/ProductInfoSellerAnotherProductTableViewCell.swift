//
//  ProductInfoSellerAnotherProductView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/11.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoSellerAnotherProductTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "ProductInfoSellerAnotherProductTableViewCell"
  
  private let sellerInfoView = UIView()
  
  private let sellerImageView: UIImageView = {
    let igv = UIImageView()
    return igv
  }()
  
  private let sellerNickName: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "판매자 닉네임"
    return lb
  }()
  
  private let sellerSubNickName: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "판매자 서브 닉네임"
    return lb
  }()

  
  
  // MARK: - Cell init
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
  }
  
    // MARK: - Setup Layout
  
  private func setUI() {
    [sellerInfoView].forEach {
      contentView.addSubview($0)
    }
    
    [sellerImageView,
    sellerNickName,
    sellerSubNickName].forEach {
      sellerInfoView.addSubview($0)
    }
    sellerImageView.image = UIImage(named: "테스트4")
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 8
    let sellerInfoViewHeight: CGFloat = 212
    
    
    [sellerInfoView].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
        $0.trailing.equalToSuperview().offset(-padding)
      }
    }
    
    sellerInfoView.snp.makeConstraints {
      $0.height.equalTo(sellerInfoViewHeight)
    }
    
    let sellerImageViewSize: CGFloat = 64
    
    [sellerImageView,
    sellerNickName,
    sellerSubNickName].forEach {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(sellerInfoView.snp.centerX)
      }
    }
    sellerImageView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
      $0.width.height.equalTo(sellerImageViewSize)
    }
    
    sellerNickName.snp.makeConstraints {
      $0.top.equalTo(sellerImageView.snp.bottom).offset(padding)
    }
    
    sellerSubNickName.snp.makeConstraints {
      $0.top.equalTo(sellerNickName.snp.bottom).offset(padding)
    }
    
    sellerImageView.clipsToBounds = true
    sellerImageView.layer.cornerRadius = sellerImageViewSize/2
  }
}
