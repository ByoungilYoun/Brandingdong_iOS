//
//  UserInfoEntryView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/26.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol UserInfoEntryViewDelegate {
  func pushNextView()
  
  func postUserData(username: String,
                    email: String,
                    password1: String,
                    password2: String,
                    phonenumber: String)
}

class UserInfoEntryView: UIView {
  // MARK: - Property
  
  private let idLabel: UserInfoLabel = {
    let lb = UserInfoLabel(title: "아이디")
    return lb
  }()
  
  private let emailLabel: UserInfoLabel = {
    let lb = UserInfoLabel(title: "이메일")
    return lb
  }()
  
  private let pwLabel: UserInfoLabel = {
    let lb = UserInfoLabel(title: "비밀번호")
    return lb
  }()
  
  private let recPersonLabel: UserInfoLabel = {
    let lb = UserInfoLabel(title: "휴대폰 번호")
    return lb
  }()
  
  private let idTextfield: UserInfoTextfield = {
    let tf = UserInfoTextfield(placeholder: "아이디 입력")
    return tf
  }()
  
  private let emailTextfield: UserInfoTextfield = {
    let tf = UserInfoTextfield(placeholder: "이메일 입력")
    return tf
  }()
  
  private let pwTextfield: UserInfoTextfield = {
    let tf = UserInfoTextfield(placeholder: "비밀번호 입력")
    return tf
  }()
  
  private let pwCheckTextfield: UserInfoTextfield = {
    let tf = UserInfoTextfield(placeholder: "비밀번호 재확인")
    return tf
  }()
  
  private let recPersonTextfield: UserInfoTextfield = {
    let tf = UserInfoTextfield(placeholder: "휴대폰 번호를 입력하세요")
    return tf
  }()
  
  private let nextButton: UserInfoButton = {
    let btn = UserInfoButton(title: "다음")
    btn.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
    return btn
  }()
  
  lazy var textfieldArr = [idTextfield,
                           emailTextfield,
                           pwTextfield,
                           pwCheckTextfield,
                           recPersonTextfield]
  
  var delegate: UserInfoEntryViewDelegate?
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    setTextfield()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    
    [idLabel,
     idTextfield,
     emailLabel,
     emailTextfield,
     pwLabel,
     pwTextfield,
     pwCheckTextfield,
     recPersonLabel,
     recPersonTextfield,
     nextButton].forEach {
      self.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 18
    let nextPadding: CGFloat = 26
    let textfieldHeight: CGFloat = 45
    
    [idLabel,
     emailLabel,
     pwLabel,
     recPersonLabel].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
      }
    }
    
    [idTextfield,
     emailTextfield,
     pwTextfield,
     pwCheckTextfield,
     recPersonTextfield,
     nextButton].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
        $0.trailing.equalToSuperview().offset(-padding)
        $0.height.equalTo(textfieldHeight)
      }
    }
    
    idLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(nextPadding)
    }
    
    idTextfield.snp.makeConstraints {
      $0.top.equalTo(idLabel.snp.bottom).offset(padding)
    }
    
    emailLabel.snp.makeConstraints {
      $0.top.equalTo(idTextfield.snp.bottom).offset(nextPadding)
    }
    
    emailTextfield.snp.makeConstraints {
      $0.top.equalTo(emailLabel.snp.bottom).offset(padding)
    }
    
    pwLabel.snp.makeConstraints {
      $0.top.equalTo(emailTextfield.snp.bottom).offset(nextPadding)
    }
    
    pwTextfield.snp.makeConstraints {
      $0.top.equalTo(pwLabel.snp.bottom).offset(padding)
    }
    
    pwCheckTextfield.snp.makeConstraints {
      $0.top.equalTo(pwTextfield.snp.bottom).offset(padding)
    }
    
    recPersonLabel.snp.makeConstraints {
      $0.top.equalTo(pwCheckTextfield.snp.bottom).offset(nextPadding)
    }
    
    recPersonTextfield.snp.makeConstraints {
      $0.top.equalTo(recPersonLabel.snp.bottom).offset(padding)
    }
    
    nextButton.snp.makeConstraints {
      $0.top.equalTo(recPersonTextfield.snp.bottom).offset(nextPadding)
    }
  }
  // MARK: - Set Textfield
  private func setTextfield() {
    [idTextfield,
     emailTextfield,
     pwTextfield,
     pwCheckTextfield,
     recPersonTextfield].forEach {
      $0.delegate = self
    }
  }
  
  private func defaultTextfield(textfield: UITextField) {
    textfield.layer.borderWidth = 1
    textfield.layer.borderColor = UIColor.lightGray.cgColor
    
    let padding: CGFloat = 5
    
    let view = UIView()
    view.backgroundColor = .systemBackground
    self.addSubview(view)
    view.snp.makeConstraints {
      $0.top.equalTo(textfield.snp.bottom).offset(padding)
      $0.leading.equalTo(textfield.snp.leading).offset(padding)
      $0.trailing.equalToSuperview()
      $0.height.equalTo(10)
    }
  }
  
  private func okTextfield(textfield: UITextField) {
    
    let padding: CGFloat = 16
    let userInfoTextfieldImageView = UserInfoTextfieldImageView()
    
    textfield.addSubview(userInfoTextfieldImageView)
    userInfoTextfieldImageView.snp.makeConstraints {
      $0.centerY.equalToSuperview()
      $0.trailing.equalToSuperview().offset(-padding)
    }
  }
  
  private func errTextfield(textfield: UITextField, message: String) {
    
    let padding: CGFloat = 5
    textfield.layer.borderWidth = 1
    textfield.layer.borderColor = UIColor.red.cgColor
    
    let errLabel: UserInfoErrLabel = {
      let lb = UserInfoErrLabel(title: message)
      return lb
    }()
    
    self.addSubview(errLabel)
    errLabel.snp.makeConstraints {
      $0.top.equalTo(textfield.snp.bottom).offset(padding)
      $0.leading.equalTo(textfield.snp.leading).offset(padding)
    }
  }
  
  private func checkTextfield(textfield: UITextField) {
    switch textfield {
    case idTextfield:
      guard textfield.text!.count > 4,
        textfield.text!.count < 20
        else { return errTextfield(textfield: textfield,
                                   message: "4~20자의 영문 소문자 숫자 조합으로 가능합니다.")}
      okTextfield(textfield: textfield)
      
    case emailTextfield:
      guard textfield.text!.contains("@"),
        textfield.text!.contains(".")
        else { return errTextfield(textfield: textfield,
                                   message: "이메일 형식이 올바르지 않습니다.")}
      okTextfield(textfield: textfield)
      
    case pwTextfield:
      guard textfield.text!.count > 8,
        textfield.text!.count < 20
        else { return errTextfield(textfield: textfield,
                                   message: "8~20자의 영문 대소문자, 숫자 특수문자 조합으로 설정해주세요.")}
      okTextfield(textfield: textfield)
      
    case pwCheckTextfield:
      guard pwTextfield.text == textfield.text
        else { return errTextfield(textfield: textfield,
                                   message: "비밀번호가 일치하지 않습니다.")}
      okTextfield(textfield: textfield)
      
    case recPersonTextfield:
      guard !(textfield.text!.isEmpty)
        else { return errTextfield(textfield: textfield,
                                   message: "휴대폰 번호가 유효하지 않습니다.")}
      okTextfield(textfield: textfield)
    default:
      break
    }
  }
  
  private func finalCheck(textfields: [UITextField]) {
    for textfield in textfields {
      guard textfield.layer.borderColor == UIColor.lightGray.cgColor,
        !(textfield.text!.isEmpty)
        else { return }
    }
    nextButton.backgroundColor = .black
    nextButton.isEnabled = true
  }
  
  @objc private func didTabButton() {
    guard nextButton.isEnabled else { return }
    delegate?.pushNextView()
    delegate?.postUserData(username: idTextfield.text!,
                           email: emailTextfield.text!,
                           password1: pwTextfield.text!,
                           password2: pwCheckTextfield.text!,
                           phonenumber: recPersonTextfield.text!)
  }
}

// MARK: - UITextFieldDelegate

extension UserInfoEntryView: UITextFieldDelegate {
  
  func textFieldDidBeginEditing(_ textField: UITextField) {
    defaultTextfield(textfield: textField)
  }
  
  func textFieldDidEndEditing(_ textField: UITextField) {
    checkTextfield(textfield: textField)
  }
  
  func textFieldDidChangeSelection(_ textField: UITextField) {
    finalCheck(textfields: textfieldArr)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
}
