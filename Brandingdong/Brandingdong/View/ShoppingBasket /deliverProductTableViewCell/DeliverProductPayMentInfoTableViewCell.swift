//
//  DeliverProductPayMentInfoTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/02.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DeliverProductPayMentInfoTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "DeliverProductPayMentInfoTableViewCell"
  
  private let productPriceTitle: UILabel = {
    let lb = UILabel()
    lb.text = "상품금액"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    return lb
  }()
  
  let productPrice: UILabel = {
    let lb = UILabel()
    lb.text = "0,000 원"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    return lb
  }()
  
  private let deliverPriceTitle: UILabel = {
    let lb = UILabel()
    lb.text = "배송비"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    return lb
  }()
  
  let deliverPrice: UILabel = {
    let lb = UILabel()
    lb.text = "무료"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    return lb
  }()
  
  let subView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    return view
  }()
  
  let allPriceTitle: UILabel = {
    let lb = UILabel()
    lb.text = "결제 예상금액"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    return lb
  }()
  
  let allPrice: UILabel = {
    let lb = UILabel()
    lb.text = "0,000 원"
    lb.textColor = .systemRed
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    return lb
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
    [productPriceTitle,
     productPrice,
     deliverPriceTitle,
     deliverPrice,
     subView,
     allPriceTitle,
     allPrice].forEach {
      contentView.addSubview($0)
     }
    
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 24
    
    [productPriceTitle,
     deliverPriceTitle,
     allPriceTitle,
     subView].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
      }
     }
    
    [productPrice,
     deliverPrice,
     allPrice,
     subView].forEach {
      $0.snp.makeConstraints {
        $0.trailing.equalToSuperview().offset(-padding)
      }
     }
    
    [productPriceTitle,
     productPrice].forEach {
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(padding)
      }
     }
    
    [deliverPriceTitle,
     deliverPrice].forEach {
      $0.snp.makeConstraints {
        $0.top.equalTo(productPriceTitle.snp.bottom).offset(padding)
      }
     }
    
    subView.snp.makeConstraints {
      $0.top.equalTo(deliverPriceTitle.snp.bottom).offset(padding)
      $0.height.equalTo(1)
    }
    
    [allPriceTitle,
     allPrice].forEach {
      $0.snp.makeConstraints {
        $0.top.equalTo(subView.snp.bottom).offset(padding)
      }
     }
  }
}
