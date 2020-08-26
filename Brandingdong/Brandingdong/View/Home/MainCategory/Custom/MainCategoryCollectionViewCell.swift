//
//  MainCategoryCollectionViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainCategoryCollectionViewCell: UICollectionViewCell {
  // MARK: - Property
  
  static let identifier = "MainCategoryCollectionViewCell"
  
  let menuName: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    return lb
  }()
  
  let categorySubLine: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  let nameSubLine: UIView = {
    let view = UIView()
    view.isHidden = true
    view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    return view
  }()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    [menuName, nameSubLine].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let subViewHeight: CGFloat = 5
    
    menuName.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
    }
    
    nameSubLine.snp.makeConstraints {
      $0.leading.trailing.equalTo(menuName)
      $0.height.equalTo(subViewHeight)
      $0.bottom.equalTo(contentView.snp.bottom)
    }
  }
}
