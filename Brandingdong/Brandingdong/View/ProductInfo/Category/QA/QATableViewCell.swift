//
//  QATableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/15.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class QATableViewCell: UITableViewCell {
  // MARK: - Property
  
  private let titleLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
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
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.text = "질문 유형을 선택해 주세요"
    return lb
  }()
  
  private let kindCheckImageView = UIImageView()
  
  private let textView = UITextView()
  
  var notOpenButton: UIButton = {
    let btn = UIButton()
    return btn
  }()
  
  var notOpenLabel: UILabel = {
    let lb = UILabel()
    return lb
  }()
  
  let submitButton: UIButton = {
    let btn = UIButton()
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
    kindCheckView,
    textView,
    notOpenButton,
    notOpenLabel]
    
  }
  
  private func setConstraints() {
    
  }
}
