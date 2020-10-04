//
//  TotalPriceCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

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
    [totalPriceLabel, totalPrice].forEach {
      contentView.addSubview($0)
    }
    
    totalPriceLabel.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(self).offset(10)
    }
    
    totalPrice.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(totalPriceLabel.snp.trailing).offset(10)
    }
  }
  
  func configure(price : String) {
    totalPrice.text = price
  }
}
