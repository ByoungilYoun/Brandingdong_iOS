//
//  ThirdTableViewCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ThirdTableViewCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "ThirdTableViewCell"
  
  private let customerCenterImageView : UIImageView = {
    let im = UIImageView()
    im.image = UIImage(named: "customerCenter")
    im.contentMode = .scaleToFill
    im.clipsToBounds = true
    return im
  }()
  
  //MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    contentView.addSubview(customerCenterImageView)
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    customerCenterImageView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(self)
      $0.bottom.equalTo(self).offset(-80)
    }
  }
}
