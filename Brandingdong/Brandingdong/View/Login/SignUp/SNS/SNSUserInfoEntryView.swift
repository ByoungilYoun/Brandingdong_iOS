//
//  SNSUserInfoEntryView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/28.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SNSUserInfoEntryView: UIView {
  // MARK: - Property
  
  private let idLabel: UserInfoLabel = {
    let lb = UserInfoLabel(title: "아이디")
    return lb
  }()
  
  private let recPersonLabel: UserInfoLabel = {
    let lb = UserInfoLabel(title: "추천인 코드 (선택사항)")
    return lb
  }()
  
  private let idTextfield: UserInfoTextfield = {
    let tf = UserInfoTextfield(placeholder: "아이디 입력")
    return tf
  }()
  
  private let recPersonTextfield: UserInfoTextfield = {
    let tf = UserInfoTextfield(placeholder: "추천인 코드를 입력하시면 1,000 포인트가 입력됩니다.")
    return tf
  }()
  
  private let nextButton: UserInfoButton = {
    let btn = UserInfoButton(title: "다음")
    btn.addTarget(self, action: #selector(didTabButton), for: .touchUpInside)
    return btn
  }()
  
  lazy var textfieldArr = [idTextfield,
                           recPersonTextfield]
  
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
     recPersonLabel].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
      }
    }
    
    [idTextfield,
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
    
    recPersonLabel.snp.makeConstraints {
      $0.top.equalTo(idTextfield.snp.bottom).offset(nextPadding)
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
  
  func errTextfield(textfield: UITextField, message: String) {
    
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
                                   message: "4~20자의 영문, 소문자 숫자만 가능합니다.")}
      okTextfield(textfield: textfield)
      
    case recPersonTextfield:
      guard !(textfield.text!.isEmpty)
        else { return errTextfield(textfield: textfield,
                                   message: "추천인 코드가 유효하지 않습니다.")}
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
  
  @objc private func didTabButton(sender: UIButton) {
    print ("다음 뷰")
  }
}

// MARK: - UITextFieldDelegate

extension SNSUserInfoEntryView: UITextFieldDelegate {
  
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
