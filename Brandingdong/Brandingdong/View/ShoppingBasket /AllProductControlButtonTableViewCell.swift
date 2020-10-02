//
//  AllProductControlButtonTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/02.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class AllProductControlButtonTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "AllProductControlButtonTableViewCell"
  
  private let checkBoxButton: UIButton = {
    let btn = UIButton()
    btn.layer.borderWidth = 1
    btn.layer.borderColor = UIColor.lightGray.cgColor
    btn.setImage(UIImage(systemName: "checkmark"), for: .normal)
    btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    return btn
  }()
  
  private let checkBoxTitle: UILabel = {
    let lb = UILabel()
    lb.text = "전체선택"
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    return lb
  }()
  
  private let allDeleteButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("전체삭제", for: .normal)
    btn.setTitleColor(.systemBlue, for: .normal)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    return btn
  }()
  
  var toggle = false
  
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
    [checkBoxButton,
    checkBoxTitle,
    allDeleteButton].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    
    [checkBoxButton,
    checkBoxTitle,
    allDeleteButton].forEach {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(contentView.snp.centerY)
      }
    }
    
    checkBoxButton.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(padding)
    }
    
    checkBoxTitle.snp.makeConstraints {
      $0.leading.equalTo(checkBoxButton.snp.trailing).offset(padding)
    }
    
    allDeleteButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-padding)
    }
  }
  
  // MARK: - Button Action
  
  private func buttonActionSet() {
    checkBoxButton.addTarget(self, action: #selector(didTapCheckBoxButton), for: .touchUpInside)
  }
  
  @objc func didTapCheckBoxButton(_ sender: UIButton) {
    if !toggle {
      checkBoxButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      toggle = !toggle
    } else {
      checkBoxButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      toggle = !toggle
    }
  }
}
