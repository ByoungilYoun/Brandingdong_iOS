//
//  SelectAllCustomButton.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/05.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SelectAllCustomButton : UIButton {
  
  //MARK: - Properties
  private let allTextLabel : UILabel = {
    let lb = UILabel()
    lb.text = "전체"
    lb.font = UIFont.systemFont(ofSize: 12)
    return lb
  }()
  
  private let nextButtonView : UIImageView = {
    let im = UIImageView()
    im.image = UIImage(systemName: "chevron.right")
    im.tintColor = .black
    return im
  }()
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    addSubview(allTextLabel)
    allTextLabel.snp.makeConstraints {
      $0.leading.centerY.equalTo(self)
    }
    
    addSubview(nextButtonView)
    nextButtonView.snp.makeConstraints {
      $0.leading.equalTo(allTextLabel.snp.trailing).offset(3)
      $0.centerY.equalTo(self)
      $0.width.equalTo(8)
      $0.height.equalTo(15)
    }
  }
}
