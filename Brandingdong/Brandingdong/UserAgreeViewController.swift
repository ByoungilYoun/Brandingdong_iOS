//
//  UserAgreeeViewController.swift
//  Brandingdong
//
//  Created by 성단빈 on 2020/08/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserAgreeViewController: UIViewController {
  // MARK: - Properties
  lazy var dismissBtn = UIBarButtonItem(
    image: UIImage(systemName: "chevron.left"),
    style: .plain,
    target: self,
    action: #selector(dismissDidTapBtn)
  )
  private let userAgreeView = UserAgreeView()
  
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setLayout()
  }
  // MARK: - SetUI
  private func setUI() {
    self.view.addSubview(userAgreeView)
    
    self.navigationItem.title = "회원가입 (1/3)"
    self.navigationItem.leftBarButtonItem = dismissBtn
    
    self.dismissBtn.tintColor = .black
  }
  
  // MARK: - SetLayout
  private func setLayout() {
    userAgreeView.snp.makeConstraints {
      $0.top.bottom.equalTo(self.view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
    }
  }
  
  // MARK: - Action Button
  
  @objc private func dismissDidTapBtn(_ sender: UIBarButtonItem) {
    
  }
}

// MARK: - Extension


