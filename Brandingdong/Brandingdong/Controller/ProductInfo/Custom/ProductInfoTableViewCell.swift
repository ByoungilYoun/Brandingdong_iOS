//
//  ProductInfoTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  static let identifier = "ProductInfoTableViewCell"
  var productInfoCellView = UIView()
  
  // MARK: - Cell init
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
  }
  
  // MARK: - Set Layout
  
  private func setUI() {
    contentView.addSubview(productInfoCellView)
  }
  
  private func setConstraints() {
    productInfoCellView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
  }
}
