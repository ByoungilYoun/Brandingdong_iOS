//
//  PurchaseOptionView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/30.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseOptionView : UIView {
  
  //MARK: - Properties
  
  private let placeHolder : UILabel = {
    let lb = UILabel()
    lb.text = "옵션을 선택해주세요"
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.7)
    lb.font = UIFont.systemFont(ofSize: 14)
    return lb
  }()
  
  private let moveDownButton : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(systemName: "chevron.down"), for: .normal)
    bt.tintColor = .black
    return bt
  }()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    [placeHolder, moveDownButton].forEach {
      self.addSubview($0)
    }
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    placeHolder.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.leading.equalToSuperview().offset(15)
    }
    
    moveDownButton.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().offset(-10)
    }
  }
  
}
