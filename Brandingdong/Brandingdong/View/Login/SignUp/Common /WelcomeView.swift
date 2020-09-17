//
//  WelcomeView.swift
//  Brandingdong
//
//  Created by 성단빈 on 2020/08/28.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol WelcomeViewDelegate {
  func pushNextView()
}

class WelcomeView: UIView {
  // MARK: - Properties
  private let imageView = UIImageView()
  private let couponBtn = UIButton()
  private let nowShoppingBtn = UIButton()
  var delegate: WelcomeViewDelegate?
  
  
  // MARK: - View LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setLayout()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func layoutSubviews() {
    self.couponBtn.layer.cornerRadius = 10
    self.couponBtn.layer.masksToBounds = true
    
    self.nowShoppingBtn.layer.cornerRadius = 10
    self.nowShoppingBtn.layer.masksToBounds = true
  }
  
  // MARK: - SetUI
  private func setUI() {
    [self.imageView, self.couponBtn, self.nowShoppingBtn].forEach {
      addSubview($0)
    }
    
    self.imageView.image = UIImage(named: "Welcome")
    
    self.couponBtn.setTitle("쿠폰 확인하기", for: .normal)
    self.couponBtn.setTitleColor(.white, for: .normal)
    self.couponBtn.backgroundColor = UIColor(red: 0.267, green: 0.248, blue: 0.248, alpha: 1)
    self.couponBtn.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 12)
    self.couponBtn.addTarget(self, action: #selector(couponDidTapBtn), for: .touchUpInside)
    
    self.nowShoppingBtn.setTitle("로그인 하기", for: .normal)
    self.nowShoppingBtn.setTitleColor(.white, for: .normal)
    self.nowShoppingBtn.backgroundColor = UIColor(red: 0.267, green: 0.248, blue: 0.248, alpha: 1)
    self.nowShoppingBtn.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 12)
    self.nowShoppingBtn.addTarget(self, action: #selector(nowShowppingDidTapBtn), for: .touchUpInside)
  }
  
  // MARK: - SetLayout
  private func setLayout() {
    self.imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    
    self.couponBtn.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(2)
      $0.leading.equalToSuperview().offset(16)
      $0.width.equalToSuperview().multipliedBy(0.45)
      $0.height.equalTo(43)
    }
    
    self.nowShoppingBtn.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(2)
      $0.trailing.equalToSuperview().offset(-16)
      $0.width.equalToSuperview().multipliedBy(0.45)
      $0.height.equalTo(43)
    }
  }
  
  // MARK: - Action Button
  
  @objc private func couponDidTapBtn(_ sender: UIButton) {
    print("couponDidTapBtn")
  }
  
  @objc private func nowShowppingDidTapBtn(_ sender: UIButton) {
    delegate?.pushNextView()
  }
}

// MARK: - Extension
