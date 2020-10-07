//
//  PurchaseSelectedCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/02.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseSelectedCell : UICollectionViewCell {
  
  //MARK: - Properties
  static let identifier = "PurchaseSelectedCell"
  
  var colorLabel : UILabel = {
    var lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 16)
    lb.text = "DDD"
    return lb
  }()
  
  let optionSubLine: UILabel = {
    let lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 16)
    lb.text = "/"
    return lb
  }()
  
  var sizeLabel : UILabel = {
    var lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 16)
    lb.text = "DDDD"
    return lb
  }()
  
  private let xmark : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(systemName: "xmark"), for: .normal)
    bt.tintColor = .lightGray
    return bt
  }()
  
  private let minusButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("-", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.layer.cornerRadius = 5
    bt.layer.borderWidth = 0.5
    bt.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
    return bt
  }()
  
  private let countLabel : UILabel = {
    let lb = UILabel()
    lb.text = "1"
    lb.textColor = .black
    lb.textAlignment = .center
    lb.layer.borderWidth = 0.5
    lb.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
    lb.layer.cornerRadius = 5
    return lb
  }()
  
  private let plusButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("+", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.layer.cornerRadius = 5
    bt.layer.borderWidth = 0.5
    bt.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.8).cgColor
    return bt
  }()
  
  private let priceLabel : UILabel = {
    let lb = UILabel()
    lb.text = "44,444 원"
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 16)
    lb.textAlignment = .left
    return lb
  }()
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - configureUI()
  private func configureUI() {
    [colorLabel,
     optionSubLine,
     sizeLabel,
     xmark,
     minusButton,
     countLabel,
     plusButton,
     priceLabel].forEach {
      contentView.addSubview($0)
    }
    
    colorLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(10)
    }
    
    optionSubLine.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalTo(colorLabel.snp.trailing).offset(10)
    }
    
    sizeLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalTo(optionSubLine.snp.trailing).offset(10)
    }
    
    xmark.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.trailing.equalToSuperview().offset(-10)
    }
    
    minusButton.snp.makeConstraints {
      $0.top.equalTo(colorLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(10)
      $0.width.height.equalTo(25)
    }
    
    countLabel.snp.makeConstraints {
      $0.top.equalTo(colorLabel.snp.bottom).offset(20)
      $0.leading.equalTo(minusButton.snp.trailing)
      $0.width.height.equalTo(25)
    }
    
    plusButton.snp.makeConstraints {
      $0.top.equalTo(colorLabel.snp.bottom).offset(20)
      $0.leading.equalTo(countLabel.snp.trailing)
      $0.width.height.equalTo(25)
    }
    
    priceLabel.snp.makeConstraints {
      $0.top.equalTo(xmark.snp.bottom).offset(40)
      $0.trailing.equalToSuperview().offset(-10)
    }
    
  }
  
  // MARK: - Configure
  
  func configure(color: String, size: String, price: String) {
    colorLabel.text = color
    sizeLabel.text = size
    priceLabel.text = price
  }
}
