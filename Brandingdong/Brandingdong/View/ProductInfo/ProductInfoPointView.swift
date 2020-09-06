//
//  ProductInfoPointView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/05.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoPointView: UIView {
  // MARK: - Property
  
  private let saveMoneyTitle: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "적립금"
    return lb
  }()
  
  private let saveMoneyPrice: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "xxx원"
    return lb
  }()
  
  private let saveMoneySubView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    return view
  }()
  
  private let saveMoneyMaxPriceTitle: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "최대 x,xxx원 추가 적립"
    return lb
  }()
  
  private let saveMoneySubTitle: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    lb.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    lb.text = "기본 1% + 하루배송 상품 2개 이상 결제 시 추가 적립"
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
    [saveMoneyTitle,
     saveMoneyPrice,
     saveMoneySubView,
     saveMoneyMaxPriceTitle,
     saveMoneySubTitle].forEach {
      self.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let margin: CGFloat = 16
    
    [saveMoneyTitle,
     saveMoneySubTitle].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(margin)
      }
    }
    saveMoneyTitle.snp.makeConstraints {
      $0.top.equalToSuperview().offset(margin)
    }
    
    saveMoneyPrice.snp.makeConstraints {
      $0.centerY.equalTo(saveMoneyTitle.snp.centerY)
      $0.leading.equalTo(saveMoneyTitle.snp.trailing).offset(margin)
    }
    
    saveMoneySubView.snp.makeConstraints {
      $0.width.equalTo(1)
      $0.top.bottom.equalTo(saveMoneyPrice)
      $0.leading.equalTo(saveMoneyPrice.snp.trailing).offset(margin)
    }
    
    saveMoneyMaxPriceTitle.snp.makeConstraints {
      $0.centerY.equalTo(saveMoneyTitle.snp.centerY)
      $0.leading.equalTo(saveMoneySubView.snp.trailing).offset(margin)
    }
    
    saveMoneySubTitle.snp.makeConstraints {
      $0.top.equalTo(saveMoneyTitle.snp.bottom).offset(margin)
    }
  }
}
