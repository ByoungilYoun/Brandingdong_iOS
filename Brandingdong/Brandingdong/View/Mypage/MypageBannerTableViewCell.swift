//
//  MypageBannerTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/30.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MypageBannerTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "MypageBannerTableViewCell"
  
  let bannerImageView = UIImageView()
  
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
    bannerImageView.image = UIImage(named: "마이페이지광고")
    contentView.addSubview(bannerImageView)
  }
  
  private func setConstraints() {
    bannerImageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
}
