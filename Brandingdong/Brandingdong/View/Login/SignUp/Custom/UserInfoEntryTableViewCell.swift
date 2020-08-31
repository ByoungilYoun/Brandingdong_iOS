//
//  UserInfoEntryTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserInfoEntryTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  var userInfoView = UIView()
  static let identifier = "UserInfoEntryTableViewCell"
  
  // MARK: - Init View

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
    contentView.addSubview(userInfoView)
  }
  
  private func setConstraints() {
    userInfoView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

}
