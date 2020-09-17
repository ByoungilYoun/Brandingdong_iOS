//
//  QATableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/15.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol UITableViewCellDelegate {
  func didTapSubmitButton()
}

class QATableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "QATableViewCell"
  
  private let titleLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.text = "문의 내용 작성"
    return lb
  }()
  
  private let kindCheckView: UIView = {
    let view = UIView()
    view.layer.borderWidth = 2
    view.layer.borderColor = UIColor.lightGray.cgColor
    return view
  }()
  
  var kindLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Medium", size: 12)
    lb.text = "질문 유형을 선택해 주세요"
    return lb
  }()
  
  private let kindCheckImageView = UIImageView()
  
  private let textView: UITextView = {
    let textView = UITextView()
    textView.layer.borderWidth = 2
    textView.layer.borderColor = UIColor.lightGray.cgColor
    textView.layer.cornerRadius = 15
    textView.clipsToBounds = true
    textView.text = "내용을 입력해 주세요."
    textView.textColor = UIColor.lightGray
    textView.textContainerInset = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12)
    return textView
  }()
  
  var notOpenButton: UIButton = {
    let btn = UIButton()
    btn.layer.borderWidth = 1
    btn.layer.borderColor = UIColor.lightGray.cgColor
    btn.setImage(UIImage(systemName: "checkmark"), for: .normal)
    btn.tintColor = .clear
    return btn
  }()
  
  var buttonToggle = false
  
  var notOpenLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.text = "비공개"
    return lb
  }()
  
  let submitButton: UIButton = {
    let btn = UIButton()
    btn.layer.borderWidth = 1
    btn.layer.borderColor = UIColor.black.cgColor
    btn.layer.cornerRadius = 5
    btn.clipsToBounds = true
    btn.setTitle("등록하기", for: .normal)
    btn.setTitleColor(.black, for: .normal)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
    return btn
  }()
  
  var delegate: UITableViewCellDelegate?
  
  // MARK: - Cell Init
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
    setTextview()
    buttonTaget()
  }
  
  // MARK: - Set LayOut
  
  private func setUI() {
    
    [titleLabel,
     kindCheckView,
     textView,
     notOpenButton,
     notOpenLabel,
     submitButton].forEach {
      contentView.addSubview($0)
    }
    
    [kindLabel,
     kindCheckImageView].forEach {
      kindCheckView.addSubview($0)
    }
    
    kindCheckView.layer.cornerRadius = 15
    kindCheckView.clipsToBounds = true
    
    kindCheckImageView.image = UIImage(systemName: "chevron.down")
    kindCheckImageView.tintColor = .lightGray
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    let notOpenPadding: CGFloat = 4
    let kindCheckViewHeight: CGFloat = 50
    let textViewHeight: CGFloat = 100
    let buttonWidth: CGFloat = 72
    
    [titleLabel,
     kindCheckView,
     textView,
     notOpenButton].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
      }
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
    }
    
    kindCheckView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(padding)
      $0.trailing.equalToSuperview().offset(-padding)
      $0.height.equalTo(kindCheckViewHeight)
    }
    
    kindLabel.snp.makeConstraints {
      $0.centerY.equalTo(kindCheckView.snp.centerY)
      $0.leading.equalTo(kindCheckView.snp.leading).offset(padding)
    }
    
    kindCheckImageView.snp.makeConstraints {
      $0.centerY.equalTo(kindCheckView.snp.centerY)
      $0.trailing.equalTo(kindCheckView.snp.trailing).offset(-padding)
    }
    
    textView.snp.makeConstraints {
      $0.top.equalTo(kindCheckView.snp.bottom).offset(padding)
      $0.trailing.equalToSuperview().offset(-padding)
      $0.height.equalTo(textViewHeight)
    }
    
    notOpenButton.snp.makeConstraints {
      $0.top.equalTo(textView.snp.bottom).offset(padding)
      $0.leading.equalToSuperview().offset(padding)
    }
    
    notOpenLabel.snp.makeConstraints {
      $0.centerY.equalTo(notOpenButton.snp.centerY)
      $0.leading.equalTo(notOpenButton.snp.trailing).offset(notOpenPadding)
    }
    
    submitButton.snp.makeConstraints {
      $0.centerY.equalTo(notOpenButton.snp.centerY)
      $0.trailing.equalTo(textView.snp.trailing)
      $0.width.equalTo(buttonWidth)
    }
  }
  
  // MARK: - Set Property
  
  private func setTextview() {
    self.textView.delegate = self
  }
  
  private func buttonTaget() {
    notOpenButton.addTarget(self, action: #selector(didTapNotOpenButton), for: .touchUpInside)
  }
  
  // MARK: - Button Action
  
  @objc func didTapNotOpenButton(_ sender: UIButton) {
    switch sender {
    case notOpenButton:
      if !buttonToggle {
        notOpenButton.tintColor = .black
        buttonToggle = !buttonToggle
      } else {
        notOpenButton.tintColor = .clear
        buttonToggle = !buttonToggle
      }
    case submitButton:
      delegate?.didTapSubmitButton()
    default:
      break
    }
  }
}

// MARK: - UITextViewDelegate

extension QATableViewCell: UITextViewDelegate {
  
  func textViewDidBeginEditing(_ textView: UITextView) {
    textView.text = ""
    textView.textColor = UIColor.black
  }
  
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if text == "\n" {
      textView.resignFirstResponder()
    }
    return true
  }
}

