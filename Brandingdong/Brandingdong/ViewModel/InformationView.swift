//
//  InformationView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/08/21.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class InformationView : UIView {
  //MARK: - Properties
  let useInfoButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("이용약관", for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
    bt.setTitleColor(.white, for: .normal)
    return bt
  }()
  
  let divider1 : UIView = {
    let dv = UIView()
    dv.backgroundColor = .white
    return dv
  }()
  
  let ruleInfoButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("개인정보취급방침", for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
    bt.setTitleColor(.white, for: .normal)
    return bt
  }()
  
  let divider2 : UIView = {
    let dv = UIView()
    dv.backgroundColor = .white
    return dv
  }()
  
  let inquiryButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("문의/신고하기", for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 10)
    bt.setTitleColor(.white, for: .normal)
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
    [useInfoButton, divider1, ruleInfoButton, divider2, inquiryButton].forEach {
      addSubview($0)
    }
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    
    useInfoButton.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalToSuperview().offset(20)
      $0.height.equalTo(20)
    }
    
    divider1.snp.makeConstraints {
      $0.top.equalToSuperview().offset(5)
      $0.leading.equalTo(useInfoButton.snp.trailing).offset(5)
      $0.width.equalTo(1)
      $0.bottom.equalToSuperview().offset(-5)
    }
    
    ruleInfoButton.snp.makeConstraints {
      $0.top.bottom.equalToSuperview()
      $0.leading.equalTo(divider1.snp.trailing).offset(10)
    }
    
    divider2.snp.makeConstraints {
      $0.top.equalToSuperview().offset(5)
      $0.leading.equalTo(ruleInfoButton.snp.trailing).offset(5)
      $0.width.equalTo(1)
      $0.bottom.equalToSuperview().offset(-5)
    }
    
    inquiryButton.snp.makeConstraints {
      $0.top.trailing.bottom.equalToSuperview()
      $0.leading.equalTo(divider2.snp.trailing).offset(10)
      $0.trailing.equalToSuperview().offset(-20)
    }
  }
}
