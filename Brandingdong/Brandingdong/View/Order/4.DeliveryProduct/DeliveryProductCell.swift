//
//  DeliveryProductCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DeliveryProductCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "DeliveryProductCell"
  
  private let mainTitle : UILabel = {
    let lb = UILabel()
    lb.text = "주문상품 정보"
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    return lb
  }()
  
  private let lineView : UIView = {
    let ln = UIView()
    ln.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    return ln
  }()
  
  var companyLabel : UILabel = {
    let lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 15)
    return lb
  }()
  
  var productImage : UIImageView = {
    let im = UIImageView()
    im.backgroundColor = .blue
    im.contentMode = .scaleAspectFill
    return im
  }()
  
  var productTitle : UILabel = {
    let lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 13)
    return lb
  }()
  
  var productSubDetail : UILabel = {
    let lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 13)
    return lb
  }()
  
  var productPriceLabel : UILabel = {
    let lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 13)
    return lb
  }()

  //MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - configureUI()
  private func configureUI() {
    [mainTitle, lineView, companyLabel, productImage, productTitle, productSubDetail, productPriceLabel].forEach {
      contentView.addSubview($0)
    }
    
    mainTitle.snp.makeConstraints {
      $0.top.equalTo(self).offset(20)
      $0.leading.equalTo(self).offset(10)
    }
    
    lineView.snp.makeConstraints {
      $0.top.equalTo(mainTitle.snp.bottom).offset(20)
      $0.leading.trailing.equalTo(self)
      $0.height.equalTo(1)
    }
    
    companyLabel.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(10)
      $0.leading.equalTo(self).offset(10)
    }
    
    productImage.snp.makeConstraints {
      $0.top.equalTo(companyLabel.snp.bottom).offset(10)
      $0.leading.equalTo(self).offset(10)
      $0.width.height.equalTo(80)
    }
    
    productTitle.snp.makeConstraints {
      $0.top.equalTo(companyLabel.snp.bottom).offset(30)
      $0.leading.equalTo(productImage.snp.trailing).offset(15)
    }
    
    productSubDetail.snp.makeConstraints {
      $0.top.equalTo(productTitle.snp.bottom).offset(5)
      $0.leading.equalTo(productImage.snp.trailing).offset(15)
    }
    
    productPriceLabel.snp.makeConstraints {
      $0.top.equalTo(productSubDetail.snp.bottom).offset(10)
      $0.leading.equalTo(productImage.snp.trailing).offset(15)
    }
  }
  
  func configure(company : String, productTitle : String, productSubDetail : String, price : String) {
    self.companyLabel.text = company
    self.productTitle.text = productTitle
    self.productSubDetail.text = productSubDetail
    self.productPriceLabel.text = price
  }
}
