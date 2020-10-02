//
//  deliverProductInfoTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/02.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DeliverProductInfoTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "DeliverProductInfoTableViewCell"
  
  let title: UILabel = {
    let lb = UILabel()
    lb.text = "브랜드 이름"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
    return lb
  }()
  
  private let checkBoxButton: UIButton = {
    let btn = UIButton()
    btn.layer.borderWidth = 1
    btn.layer.borderColor = UIColor.lightGray.cgColor
    btn.setImage(UIImage(systemName: "checkmark"), for: .normal)
    btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    return btn
  }()
  
  var toggle = false
  
  private let checkBoxTitle: UILabel = {
    let lb = UILabel()
    lb.text = "상품선택"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    return lb
  }()
  
  private let deleteButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("삭제하기", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    return btn
  }()
  
  let productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 15
    imageView.backgroundColor = .systemBlue
    return imageView
  }()
  
  let productTitle: UILabel = {
    let lb = UILabel()
    lb.text = "상품이름"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    return lb
  }()
  
  let optionTitle: UILabel = {
    let lb = UILabel()
    lb.text = "옵션"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    return lb
  }()
  
  let priceTitle: UILabel = {
    let lb = UILabel()
    lb.text = "가격"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
    return lb
  }()
  
  let fastBuyButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("바로 구매하기", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
    return btn
  }()
  
  // MARK: - Cell Init
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
  }
  
  // MARK: - Set LayOut
  
  private func setUI() {
    [title,
     checkBoxButton,
     checkBoxTitle,
     deleteButton,
     productImageView,
     productTitle,
     optionTitle,
     priceTitle,
     fastBuyButton].forEach {
      contentView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    let imageSize: CGFloat = 72
    let buttonHeight: CGFloat = 48
    
    
    [title,
     checkBoxButton,
     productImageView,
     fastBuyButton].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
      }
     }
    
    title.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
    }
    
    checkBoxButton.snp.makeConstraints {
      $0.top.equalTo(title.snp.bottom).offset(padding)
    }
    
    checkBoxTitle.snp.makeConstraints {
      $0.top.equalTo(checkBoxButton.snp.top)
      $0.leading.equalTo(checkBoxButton.snp.trailing).offset(padding)
    }
    
    deleteButton.snp.makeConstraints {
      $0.top.equalTo(checkBoxButton.snp.top)
      $0.trailing.equalToSuperview().offset(-padding)
    }
    
    productImageView.snp.makeConstraints {
      $0.top.equalTo(checkBoxButton.snp.bottom).offset(padding)
      $0.width.height.equalTo(imageSize)
    }
    
    [productTitle,
     optionTitle,
     priceTitle].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalTo(productImageView.snp.trailing).offset(padding)
      }
     }
    
    productTitle.snp.makeConstraints {
      $0.top.equalTo(productImageView.snp.top)
    }
    
    optionTitle.snp.makeConstraints {
      $0.centerY.equalTo(productImageView.snp.centerY)
    }
    
    priceTitle.snp.makeConstraints {
      $0.bottom.equalTo(productImageView.snp.bottom)
    }
    
    fastBuyButton.snp.makeConstraints {
      $0.top.equalTo(productImageView.snp.bottom).offset(padding)
      $0.leading.equalToSuperview().offset(padding)
      $0.trailing.equalToSuperview().offset(-padding)
      $0.height.equalTo(buttonHeight)
    }
    
    fastBuyButton.layer.borderWidth = 1
    fastBuyButton.layer.borderColor = UIColor.black.cgColor
    fastBuyButton.layer.cornerRadius = 10
    fastBuyButton.clipsToBounds = true
  }
  
  // MARK: - Action Button
  
  private func setAddTargetButton() {
    checkBoxButton.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
  }
  
  @objc func didTapCheckBoxButton(_ sender: UIButton) {
    if !toggle {
      checkBoxButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      toggle = !toggle
    } else {
      checkBoxButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      toggle = !toggle
    }
  }
}
