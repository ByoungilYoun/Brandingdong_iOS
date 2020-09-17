//
//  WelcomeViewController.swift
//  Brandingdong
//
//  Created by 성단빈 on 2020/08/28.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
  // MARK: - Properties
  lazy var dismissBtn = UIBarButtonItem(
    image: UIImage(systemName: "chevron.left"),
    style: .plain,
    target: self,
    action: #selector(dismissDidTapBtn)
  )
  
  private let welcomeView = WelcomeView()
  
  // MARK: - View LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUI()
    setLayout()
    setDelegate()
  }
  // MARK: - SetUI
  private func setUI() {
    self.view.addSubview(welcomeView)
    
    self.navigationItem.title = "회원가입 (3/3)"
    self.navigationItem.leftBarButtonItem = dismissBtn
    
    self.dismissBtn.tintColor = .black
  }
  
  // MARK: - SetLayout
  private func setLayout() {
    self.welcomeView.snp.makeConstraints {
      $0.top.equalTo(self.view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }
  }
  
  // MARK: - Set Delegate
  private func setDelegate() {
    welcomeView.delegate = self
  }
  
  // MARK: - Action Button
  
  @objc private func dismissDidTapBtn(_ sender: UITabBarItem) {
    navigationController?.popViewController(animated: true)
  }
}

// MARK: - Extension

extension WelcomeViewController: WelcomeViewDelegate {
  func pushNextView() {
//    let homeVC = HomeViewController()
//    homeVC.view.backgroundColor = .systemBackground
//    navigationController?.pushViewController(homeVC, animated: true)
    let loginVC = LoginViewController()
    navigationController?.pushViewController(loginVC, animated: true)
  }
}
