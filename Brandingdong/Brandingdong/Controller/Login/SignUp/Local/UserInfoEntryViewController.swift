//
//  UserInfoEntryViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/26.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class UserInfoEntryViewController: UIViewController {
  // MARK: - Property
  
  private let userinfoEntryTableView = UserinfoEntryTableView()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavi()
    setUI()
    setConstraints()
    setDelegate()
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    view.addSubview(userinfoEntryTableView)
  }
  
  private func setConstraints() {
    
    userinfoEntryTableView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  // MARK: - Set Delegate
  
  private func setDelegate() {
    userinfoEntryTableView.userInfoEntryView.delegate = self
  }
  
  // MARK: - NavigationBar
  
  private func setNavi() {
    
    navigationItem.title = "회원가입 (2/3)"
    
    let leftDismissButton = UIBarButtonItem(
      image: UIImage(systemName: "chevron.left"),
      style: .plain,
      target: self,
      action: #selector(didTapDismissButton))
    
    leftDismissButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.layoutIfNeeded()
  }
  
  @objc private func didTapDismissButton(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
}

// MARK: - UserInfoEntryViewDelegate

extension UserInfoEntryViewController: UserInfoEntryViewDelegate {
  func postUserData(username: String, email: String, password1: String, password2: String, phonenumber: String) {
    Service.signUpUser(username: username,
                       email: email,
                       password1: password1,
                       password2: password2,
                       phonenumber: phonenumber)
  }
  
  func pushNextView() {
    let welcomeVC = WelcomeViewController()
    welcomeVC.view.backgroundColor = .systemBackground
    navigationController?.pushViewController(welcomeVC, animated: true)
  }
}
