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
