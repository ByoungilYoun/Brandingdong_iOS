//
//  TotalPriceCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol TotalPriceCellDelegate: class {
  func buyButtonClicked()
}

class TotalPriceCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifer = "TotalPriceCell"
  
  private let totalPriceLabel : UILabel = {
    let lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    lb.text = "최종결제금액"
    return lb
  }()
  
  var totalPrice : UILabel = {
    var lb = UILabel()
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    lb.textColor = .systemPink
    return lb
  }()
  
  lazy var buyNowButton : UIButton = {
    var bt = UIButton()
    bt.backgroundColor = .black
    bt.setTitleColor(.white, for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.addTarget(self, action: #selector(buyButtonClicked), for: .touchUpInside)
    return bt
  }()
  
  var delegate : TotalPriceCellDelegate?
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
    [totalPriceLabel, totalPrice, buyNowButton].forEach {
      contentView.addSubview($0)
    }
    
    totalPriceLabel.snp.makeConstraints {
      $0.top.equalTo(self).offset(15)
      $0.leading.equalTo(self).offset(10)
    }
    
    totalPrice.snp.makeConstraints {
      $0.top.equalTo(self).offset(25)
      $0.leading.equalTo(totalPriceLabel.snp.trailing).offset(10)
    }
    
    buyNowButton.snp.makeConstraints {
      $0.top.equalTo(totalPriceLabel.snp.bottom).offset(20)
      $0.leading.trailing.equalTo(self)
      $0.height.equalTo(50)
      $0.bottom.equalTo(self)
    }
  }
  
  func configure(price : String) {
    totalPrice.text = price
    buyNowButton.setTitle("\(price)원 결제하기", for: .normal)
  }
  
  @objc func buyButtonClicked() {
    delegate?.buyButtonClicked()
  }
}
