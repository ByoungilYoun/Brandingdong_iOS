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
    setDelegate()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
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
  
  // MARK: - Set Delegate
  
  private func setDelegate() {
    userAgreeView.delegate = self
  }
  
  // MARK: - NavigationBar
  private func setNavi() {
    navigationController?.navigationBar.isHidden = false
  }
  
  // MARK: - Action Button
  
  @objc private func dismissDidTapBtn(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
}

// MARK: - Extension

extension UserAgreeViewController: UserAgreeViewDelegate {
  func pushNextView() {
    let userInfoEntryVC = UserInfoEntryViewController()
    navigationController?.pushViewController(userInfoEntryVC, animated: true)
  }
}

