//
//  FirstCategoryCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/07.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FirstCategoryCell : UICollectionViewCell {
  
  //MARK: - Properties
  static let identifier = "FirstCategoryCell"
  
  private let menuName : UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    lb.textAlignment = .center
    return lb
  }()
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    [menuName].forEach {
      contentView.addSubview($0)
    }
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    menuName.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
    }
  }
  
}
