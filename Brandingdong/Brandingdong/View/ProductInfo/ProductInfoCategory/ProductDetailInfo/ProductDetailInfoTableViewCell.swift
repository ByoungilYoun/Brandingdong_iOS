//
//  ProductDetailInfoTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductDetailInfoTableViewCell: UITableViewCell {
  // MARK: - Property
  
  let detailInfoView = UIView()
  static let identifier = "ProductDetailInfoTableViewCell"
  
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
    detailInfoView.backgroundColor = .lightGray
    contentView.addSubview(detailInfoView)
  }
  
  private func setConstraints() {
    detailInfoView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalTo(contentView)
    }
  }

}
