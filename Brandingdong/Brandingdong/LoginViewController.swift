//
//  LoginViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/08/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol AuthenticationControllerProtocol {
  func checkIdFormStatus()
  func checkPasswordFormStatus()
  func checkXmarkOnId()
}

class LoginViewController : UIViewController {
  //MARK: - Properties
  private let idTextField : CustomTextField = {
    let tx = CustomTextField(placeholder: "아이디 입력")
    tx.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    return tx
  }()
  
  private let passwordTextField : CustomTextField = {
    let tx = CustomTextField(placeholder: "비밀번호 입력")
    tx.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    tx.isSecureTextEntry = true
    return tx
  }()
  
  private let loginButton : LocalLoginButton = {
    let bt = LocalLoginButton(title: "로그인", color: .black)
    bt.addTarget(self, action: #selector(loginBtnTap), for: .touchUpInside)
    return bt
  }()
  
  private let findIdButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("아이디 찾기", for: .normal)
    bt.setTitleColor(UIColor.black, for: .normal)
    bt.layer.borderColor = UIColor.lightGray.cgColor
    bt.layer.borderWidth = 1.0
    bt.layer.cornerRadius = 10
    return bt
  }()
  
  private let findPasswordButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("비밀번호 찾기", for: .normal)
    bt.setTitleColor(UIColor.black, for: .normal)
    bt.layer.borderColor = UIColor.lightGray.cgColor
    bt.layer.borderWidth = 1.0
    bt.layer.cornerRadius = 10
    return bt
  }()
  
  private let textLabel : UILabel = {
    let lb = UILabel()
    lb.text = "아이디 찾기와 비밀번호 찾기는 실명인증을 한 유저만 가능합니다"
    lb.font = UIFont.systemFont(ofSize: 10)
    lb.textColor = UIColor.black.withAlphaComponent(0.7)
    lb.textAlignment = .left
    return lb
  }()
  
  private let xmarkButton1 : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
    bt.tintColor = .lightGray
    bt.alpha = 0
    bt.addTarget(self, action: #selector(idTextRemove), for: .touchUpInside)
    return bt
  }()
  
  private let xmarkButton2 : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
    bt.tintColor = .lightGray
    bt.alpha = 0
    bt.addTarget(self, action: #selector(passwordTextRemove), for: .touchUpInside)
    return bt
  }()
  
  private var viewModel = LoginViewModel()
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavi()
    setUI()
    setConstraint()
  }
  
  //MARK: - setNavi()
  private func setNavi() {
    view.backgroundColor = .white
    navigationItem.title = "로그인"
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(moveBack))
    navigationItem.leftBarButtonItem?.tintColor = .black
  }
  
  //MARK: - setUI()
  private func setUI() {
    [idTextField, passwordTextField, loginButton, findIdButton, findPasswordButton, textLabel].forEach {
      view.addSubview($0)
    }
    
    idTextField.addSubview(xmarkButton1)
    passwordTextField.addSubview(xmarkButton2)
    
  }
  
  //MARK: - setConstraint()
  private func setConstraint() {
    [idTextField, passwordTextField, loginButton].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
        $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
      }
    }
    
    idTextField.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
    }
    
    passwordTextField.snp.makeConstraints {
      $0.top.equalTo(idTextField.snp.bottom).offset(15)
    }
    
    loginButton.snp.makeConstraints {
      $0.top.equalTo(passwordTextField.snp.bottom).offset(15)
      $0.height.equalTo(40)
    }
    
    let realWidth = (view.frame.size.width - 40) / 2
    
    findIdButton.snp.makeConstraints {
      $0.top.equalTo(loginButton.snp.bottom).offset(10)
      $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
      $0.width.equalTo(realWidth)
      $0.height.equalTo(50)
    }
    
    findPasswordButton.snp.makeConstraints {
      $0.top.equalTo(loginButton.snp.bottom).offset(10)
      $0.leading.equalTo(findIdButton.snp.trailing).offset(10)
      $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
      $0.width.equalTo(realWidth)
      $0.height.equalTo(50)
    }
    
    textLabel.snp.makeConstraints {
      $0.top.equalTo(findIdButton.snp.bottom).offset(10)
      $0.leading.equalTo(view.safeAreaLayoutGuide).offset(15)
      $0.height.equalTo(20)
    }
    
    xmarkButton1.snp.makeConstraints {
      $0.top.equalTo(idTextField).offset(5)
      $0.trailing.equalTo(idTextField).offset(-10)
      $0.bottom.equalTo(idTextField).offset(-5)
    }
    
    xmarkButton2.snp.makeConstraints {
      $0.top.equalTo(passwordTextField).offset(5)
      $0.trailing.equalTo(passwordTextField).offset(-10)
      $0.bottom.equalTo(passwordTextField).offset(-5)
    }
  }
  
  //MARK: - @objc func
  @objc func moveBack() {
    dismiss(animated: true, completion: nil)
  }
  
  @objc func loginBtnTap() {
    
  }
  
  @objc func idTextRemove() {
    idTextField.text?.removeAll()
  }
  
  @objc func passwordTextRemove() {
    passwordTextField.text?.removeAll()
  }
  
  @objc func textDidChange(sender : UITextField) {
    if sender == idTextField {
      viewModel.id = sender.text
      checkIdFormStatus()
      checkXmarkOnId()
    } else {
      viewModel.password = sender.text
      checkPasswordFormStatus()
      checkXmarkOnPassword()
    }
  }
}

//MARK: - extension 
extension LoginViewController : AuthenticationControllerProtocol {
  func checkIdFormStatus() {
    if viewModel.IdIsValid {
      idTextField.layer.borderColor = UIColor.lightGray.cgColor
      idTextField.layer.borderWidth = 1.0
    } else {
      idTextField.layer.borderColor = UIColor.red.cgColor
      idTextField.layer.borderWidth = 1.0
    }
  }
  
  func checkPasswordFormStatus() {
    if viewModel.PasswordIsValid {
      passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
      passwordTextField.layer.borderWidth = 1.0
    } else {
      passwordTextField.layer.borderColor = UIColor.red.cgColor
      passwordTextField.layer.borderWidth = 1.0
    }
  }
  
  func checkXmarkOnId() {
    if viewModel.xmarkOnId {
      xmarkButton1.alpha = 1
    } else {
      xmarkButton1.alpha = 0
    }
  }
  
  func checkXmarkOnPassword() {
    if viewModel.xmarkOnPassword {
      xmarkButton2.alpha = 1
    } else {
      xmarkButton2.alpha = 0
    }
  }
}

