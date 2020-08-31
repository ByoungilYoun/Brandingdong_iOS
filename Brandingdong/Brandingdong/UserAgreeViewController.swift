//
//  UserAgreeeViewController.swift
//  Brandingdong
//
//  Created by 성단빈 on 2020/08/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserAgreeeViewController: UIViewController {
  // MARK: - Properties
  lazy var dismissBtn = UIBarButtonItem(
    image: UIImage(systemName: "chevron.left"),
    style: .plain,
    target: self,
    action: #selector(dismissDidTapBtn)
  )
  private let subTitleLabel = UILabel()
  private let underLine = UIView()
  private let allAgreeeBtn = UIButton()
  private let agree
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setLayout()
  }
  // MARK: - SetUI
  private func setUI() {
    [subTitleLabel, underLine].forEach {
      self.view.addSubview($0)
    }
    
    self.navigationItem.title = "회원가입 (1/3)"
    self.navigationItem.leftBarButtonItem = dismissBtn
    
    self.dismissBtn.tintColor = .black
    
    self.subTitleLabel.text = "가입 약관 동의"
    self.subTitleLabel.textColor = .black
    self.subTitleLabel.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 14)
    
    self.underLine.backgroundColor = .systemGray4
  }
  
  // MARK: - SetLayout
  private func setLayout() {
    self.subTitleLabel.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(25)
      $0.leading.equalToSuperview().offset(16)
    }
    
    self.underLine.snp.makeConstraints {
      $0.top.equalTo(subTitleLabel.snp.bottom).offset(27)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.height.equalTo(1)
    }
  }
  
  // MARK: - Action Button
  
  @objc private func dismissDidTapBtn(_ sender: UIBarButtonItem) {
    
  }
  
  
}

// MARK: - Extension


