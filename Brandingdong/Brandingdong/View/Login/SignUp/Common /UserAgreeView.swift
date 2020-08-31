//
//  UserAgreeView.swift
//  Brandingdong
//
//  Created by 성단빈 on 2020/08/27.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol UserAgreeViewDelegate {
  func pushNextView()
}

class UserAgreeView: UIView {
  // MARK: - Properties
  private let subTitleLabel = UILabel()
  private let underLine = UIView()
  private let allAgreeBtn = UIButton()
  private let agreeBtn1 = UIButton()
  private let agreeBtn2 = UIButton()
  private let agreeBtn3 = UIButton()
  private let agreeBtn4 = UIButton()
  private let allAgreeLabel = UILabel()
  private let agreeBtnLabels: [UILabel] = []
  private let agreeBtn1Label = UILabel()
  private let agreeBtn2Label = UILabel()
  private let agreeBtn3Label = UILabel()
  private let agreeBtn4Label = UILabel()
  private let containerView = UIView()
  private let viewContentLabel1 = UILabel()
  private let viewContentLabel2 = UILabel()
  private let viewContentLabel3 = UILabel()
  private let viewContentLabel4 = UILabel()
  private let nextViewBtn = UIButton()
  private let noticeLabel = UILabel()
  var delegate: UserAgreeViewDelegate?
  
  // MARK: - View LifeCycle
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    setUI()
    setLayout()
  }
  
  override func layoutSubviews() {
    [
      self.allAgreeBtn,
      self.agreeBtn1,
      self.agreeBtn2,
      self.agreeBtn3,
      self.agreeBtn4,
      ].forEach {
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    
    self.containerView.layer.cornerRadius = 10
    self.containerView.layer.masksToBounds = true
    
    self.nextViewBtn.layer.cornerRadius = 10
    self.nextViewBtn.layer.masksToBounds = true
    
    self.noticeLabel.layer.cornerRadius = 2
    self.noticeLabel.layer.masksToBounds = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - SetUI
  private func setUI() {
    [
      self.subTitleLabel,
      self.underLine,
      self.allAgreeBtn,
      self.allAgreeLabel,
      self.containerView,
      self.nextViewBtn,
      self.noticeLabel
      ].forEach {
        self.addSubview($0)
    }
    
    [
      self.agreeBtn1,
      self.agreeBtn2,
      self.agreeBtn3,
      self.agreeBtn4,
      self.agreeBtn1Label,
      self.agreeBtn2Label,
      self.agreeBtn3Label,
      self.agreeBtn4Label,
      self.viewContentLabel1,
      self.viewContentLabel2,
      self.viewContentLabel3,
      self.viewContentLabel4,
      ].forEach {
        containerView.addSubview($0)
    }
    
    self.subTitleLabel.text = "가입 약관 동의"
    self.subTitleLabel.textColor = .black
    self.subTitleLabel.font = UIFont.init(name: "AppleSDGothicNeo-Bold", size: 14)
    
    self.underLine.backgroundColor = .systemGray6
    
    self.allAgreeLabel.text = "모두 동의"
    
    [
      self.allAgreeBtn,
      self.agreeBtn1,
      self.agreeBtn2,
      self.agreeBtn3,
      self.agreeBtn4
      ].forEach {
        let largeConfig = UIImage.SymbolConfiguration(pointSize: 10)
        let largeBoldDoc = UIImage(systemName: "checkmark", withConfiguration: largeConfig)
        
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.tintColor = .black
        $0.addTarget(self, action: #selector(self.agreeDidTapBtn), for: .touchUpInside)
        $0.setImage(largeBoldDoc, for: .selected)
    }
    
    self.containerView.layer.borderWidth = 1
    self.containerView.layer.borderColor = UIColor.systemGray4.cgColor
    
    self.agreeBtn1Label.text = "브랜디 약관 동의 (필수)"
    self.agreeBtn2Label.text = "개인정보수집 및 이용에 대한 안내 (필수)"
    self.agreeBtn3Label.text = "이벤트/마케팅 수신 동의 (선택)"
    self.agreeBtn4Label.text = "야간 혜택 알림 수신 동의 (선택)"
    
    [
      self.allAgreeLabel,
      self.agreeBtn1Label,
      self.agreeBtn2Label,
      self.agreeBtn3Label,
      self.agreeBtn4Label
      ].forEach {
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 12)
        $0.textColor = .black
    }
    
    let agreeBtn1LabelStr = NSMutableAttributedString(string: self.agreeBtn1Label.text!)
    let agreeBtn2LabelStr = NSMutableAttributedString(string: self.agreeBtn2Label.text!)
    let agreeBtn3LabelStr = NSMutableAttributedString(string: self.agreeBtn3Label.text!)
    let agreeBtn4LabelStr = NSMutableAttributedString(string: self.agreeBtn4Label.text!)
    let color = UIColor.init(red: 0.925, green: 0.066, blue: 0.066, alpha: 1)
    
    agreeBtn1LabelStr.addAttribute(
      NSAttributedString.Key.foregroundColor,
      value: color,
      range: (self.agreeBtn1Label.text! as NSString).range(of:"(필수)")
    )
    
    agreeBtn2LabelStr.addAttribute(
      NSAttributedString.Key.foregroundColor,
      value: color,
      range: (self.agreeBtn2Label.text! as NSString).range(of:"(필수)")
    )
    
    agreeBtn3LabelStr.addAttribute(
      NSAttributedString.Key.foregroundColor,
      value: color,
      range: (self.agreeBtn3Label.text! as NSString).range(of:"(선택)")
    )
    
    agreeBtn4LabelStr.addAttribute(
      NSAttributedString.Key.foregroundColor,
      value: color,
      range: (self.agreeBtn4Label.text! as NSString).range(of:"(선택)")
    )
    
    self.agreeBtn1Label.attributedText = agreeBtn1LabelStr
    self.agreeBtn2Label.attributedText = agreeBtn2LabelStr
    self.agreeBtn3Label.attributedText = agreeBtn3LabelStr
    self.agreeBtn4Label.attributedText = agreeBtn4LabelStr
    
    [
      self.viewContentLabel1,
      self.viewContentLabel2,
      self.viewContentLabel3,
      self.viewContentLabel4
      ].forEach {
        $0.text = "내용보기"
        $0.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 10)
        $0.textColor = .gray
    }
    
    self.nextViewBtn.setTitle("다음", for: .normal)
    self.nextViewBtn.setTitleColor(.white, for: .normal)
    self.nextViewBtn.backgroundColor = .systemGray4
    self.nextViewBtn.titleLabel?.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 12)
    self.nextViewBtn.addTarget(self, action: #selector(nextViewDidTapBtn), for: .touchUpInside)
    
    self.noticeLabel.text = "개인정보 수집 및 이용에 동의해 주세요"
    self.noticeLabel.textColor = .white
    self.noticeLabel.textAlignment = .center
    self.noticeLabel.font = UIFont.init(name: "AppleSDGothicNeo-Medium", size: 14)
    self.noticeLabel.backgroundColor = UIColor(red: 0.267, green: 0.248, blue: 0.248, alpha: 1)
    self.noticeLabel.alpha = 0
  }
  
  // MARK: - SetLayout
  private func setLayout() {
    self.subTitleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(25)
      $0.leading.equalToSuperview().offset(16)
    }
    
    self.underLine.snp.makeConstraints {
      $0.top.equalTo(subTitleLabel.snp.bottom).offset(27)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.height.equalTo(1)
    }
    
    self.allAgreeBtn.snp.makeConstraints {
      $0.top.equalTo(underLine.snp.bottom).offset(25)
      $0.leading.equalToSuperview().offset(16)
      $0.width.height.equalTo(20)
    }
    
    self.allAgreeLabel.snp.makeConstraints {
      $0.centerY.equalTo(allAgreeBtn.snp.centerY)
      $0.leading.equalTo(allAgreeBtn.snp.trailing).offset(12)
    }
    
    self.containerView.snp.makeConstraints {
      $0.top.equalTo(allAgreeBtn.snp.bottom).offset(12)
      $0.leading.equalTo(self.snp.leading).offset(16)
      $0.trailing.equalTo(self.snp.trailing).offset(-16)
    }
    
    self.agreeBtn1.snp.makeConstraints {
      $0.top.equalToSuperview().offset(18)
      $0.leading.equalToSuperview().offset(16)
      $0.width.height.equalTo(20)
    }
    
    self.agreeBtn2.snp.makeConstraints {
      $0.top.equalTo(agreeBtn1.snp.bottom).offset(12)
      $0.leading.equalToSuperview().offset(16)
      $0.width.height.equalTo(20)
    }
    
    self.agreeBtn3.snp.makeConstraints {
      $0.top.equalTo(agreeBtn2.snp.bottom).offset(12)
      $0.leading.equalToSuperview().offset(16)
      $0.width.height.equalTo(20)
    }
    
    self.agreeBtn4.snp.makeConstraints {
      $0.top.equalTo(agreeBtn3.snp.bottom).offset(12)
      $0.leading.equalTo(agreeBtn3.snp.trailing)
      $0.width.height.equalTo(20)
      $0.bottom.equalToSuperview().offset(-18)
    }
    
    self.agreeBtn1Label.snp.makeConstraints {
      $0.centerY.equalTo(agreeBtn1.snp.centerY)
      $0.leading.equalTo(agreeBtn1.snp.trailing).offset(8)
    }
    
    self.agreeBtn2Label.snp.makeConstraints {
      $0.centerY.equalTo(agreeBtn2.snp.centerY)
      $0.leading.equalTo(agreeBtn2.snp.trailing).offset(8)
    }
    
    self.agreeBtn3Label.snp.makeConstraints {
      $0.centerY.equalTo(agreeBtn3.snp.centerY)
      $0.leading.equalTo(agreeBtn3.snp.trailing).offset(8)
    }
    
    self.agreeBtn4Label.snp.makeConstraints {
      $0.centerY.equalTo(agreeBtn4.snp.centerY)
      $0.leading.equalTo(agreeBtn4.snp.trailing).offset(8)
    }
    
    self.viewContentLabel1.snp.makeConstraints {
      $0.centerY.equalTo(agreeBtn1.snp.centerY)
      $0.trailing.equalToSuperview().offset(-20)
    }
    
    self.viewContentLabel2.snp.makeConstraints {
      $0.centerY.equalTo(agreeBtn2.snp.centerY)
      $0.trailing.equalToSuperview().offset(-20)
    }
    
    self.viewContentLabel3.snp.makeConstraints {
      $0.centerY.equalTo(agreeBtn3.snp.centerY)
      $0.trailing.equalToSuperview().offset(-20)
    }
    
    self.viewContentLabel4.snp.makeConstraints {
      $0.centerY.equalTo(agreeBtn4.snp.centerY)
      $0.trailing.equalToSuperview().offset(-20)
    }
    
    self.nextViewBtn.snp.makeConstraints {
      $0.top.equalTo(containerView.snp.bottom).offset(17)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-16)
      $0.height.equalTo(43)
    }
    
    self.noticeLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(48)
      $0.trailing.equalToSuperview().offset(-48)
      $0.bottom.equalTo(allAgreeBtn.snp.top).offset(-4)
      $0.height.equalTo(26)
    }
  }
  
  // MARK: - Action Button
  
  @objc private func agreeDidTapBtn(_ sender: UIButton) {
    sender.isSelected = !sender.isSelected
    
    switch sender {
    case self.allAgreeBtn:
      if sender.isSelected == true {
        self.agreeBtn1.isSelected = true
        self.agreeBtn2.isSelected = true
        self.agreeBtn3.isSelected = true
        self.agreeBtn4.isSelected = true
      } else {
        self.agreeBtn1.isSelected = false
        self.agreeBtn2.isSelected = false
        self.agreeBtn3.isSelected = false
        self.agreeBtn4.isSelected = false
      }
    default:
      break
    }
    
    if self.agreeBtn1.isSelected == true && self.agreeBtn2.isSelected == true {
      self.nextViewBtn.backgroundColor = UIColor(red: 0.267, green: 0.248, blue: 0.248, alpha: 1)
    } else {
      self.nextViewBtn.backgroundColor = .systemGray4
    }
  }
  
  @objc private func nextViewDidTapBtn(_ sender: UIButton) {
    if self.agreeBtn1.isSelected == true && self.agreeBtn2.isSelected == true {
      delegate?.pushNextView()
    } else {
      self.nextViewBtn.backgroundColor = UIColor(red: 0.267, green: 0.248, blue: 0.248, alpha: 1)
      
      UIView.animate(withDuration: 0.1, delay: 0, animations: {
        self.nextViewBtn.backgroundColor = .systemGray4
        self.noticeLabel.alpha = 1
      }) { isFinished in
        if isFinished {
          UIView.animate(withDuration: 0.1, delay: 3, animations: {
            self.noticeLabel.alpha = 0
          })
        }
      }
    }
  }
}

// MARK: - Extension

