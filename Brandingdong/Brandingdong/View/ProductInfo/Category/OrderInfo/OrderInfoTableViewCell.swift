//
//  OrderInfoTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class OrderInfoTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "OrderInfoTableViewCell"
  let orderInfoImageView = UIImageView()
  
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
    orderInfoImageView.image = UIImage(named: "주문정보")
    contentView.addSubview(orderInfoImageView)
  }
  
  private func setConstraints() {
    orderInfoImageView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
  }
}
