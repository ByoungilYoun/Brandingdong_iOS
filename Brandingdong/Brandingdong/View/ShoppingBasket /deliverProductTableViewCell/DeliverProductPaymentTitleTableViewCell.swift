//
//  DeliverProductPaymentTitleTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/02.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DeliverProductPaymentTitleTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "DeliverProductPaymentTitleTableViewCell"
  
  private let title: UILabel = {
    let lb = UILabel()
    lb.text = "결제 예상금액"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
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
    contentView.addSubview(title)
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    
    title.snp.makeConstraints {
      $0.centerY.equalTo(contentView.snp.centerY)
      $0.leading.equalToSuperview().offset(padding)
    }
  }
}
