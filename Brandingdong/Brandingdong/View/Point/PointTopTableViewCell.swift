//
//  PointTopTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/01.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PointTopTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "PointTopTableViewCell"
  
  private let titleLabel: PointTopLabel = {
    let lb = PointTopLabel(title: "포인트")
    return lb
  }()
  
  var priceLabel: PointTopLabel = {
    let lb = PointTopLabel(title: "0 원")
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
    [titleLabel,
     priceLabel].forEach {
      contentView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    
    [titleLabel,
     priceLabel].forEach {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(contentView.snp.centerY)
      }
     }
    
    titleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(padding)
    }
    
    priceLabel.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-padding)
    }
  }
}
