//
//  PointMiddleTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/01.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PointMiddleTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "PointMiddleTableViewCell"
  
  private let titleLabel: PointTopLabel = {
    let lb = PointTopLabel(title: "포인트 등록하기")
    return lb
  }()
  
  private let codeTextfield: PointTextfield = {
    let textfield = PointTextfield(placeholder: "포인트코드를 입력해주세요.")
    return textfield
  }()
  
  private let submitButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("등록", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    return btn
  }()
  
  // MARK: - Cell Init
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
  }
  
  // MARK: - Set LayOut
  
  private func setUI() {
    [titleLabel,
    codeTextfield,
    submitButton].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 8
    let secondPadding: CGFloat = 16
    let size: CGFloat = 48
    
    titleLabel.snp.makeConstraints {
      $0.top.leading.equalToSuperview().offset(secondPadding)
    }
    
    codeTextfield.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(secondPadding)
      $0.leading.equalToSuperview().offset(secondPadding)
      $0.trailing.equalTo(submitButton.snp.leading).offset(-secondPadding)
      $0.height.equalTo(size)
    }
    
    submitButton.snp.makeConstraints {
      $0.top.equalTo(codeTextfield.snp.top)
      $0.trailing.equalToSuperview().offset(-padding)
      $0.width.height.equalTo(size)
    }
    
    submitButton.layer.borderWidth = 1
    submitButton.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    submitButton.layer.cornerRadius = 15
    submitButton.clipsToBounds = true
  }
}
