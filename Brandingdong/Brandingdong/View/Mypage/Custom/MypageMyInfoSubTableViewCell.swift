//
//  MypageMyInfoSubTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/30.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MypageMyInfoSubTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "MypageMyInfoSubTableViewCell"
  
  let titleImageView = UIImageView()
  let titleLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    return lb
  }()
  
  let timeLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
    lb.textColor = UIColor.lightGray
    return lb
  }()
  
  let contentsLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    lb.numberOfLines = 0
    return lb
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
    [titleImageView,
    titleLabel,
    timeLabel,
    contentsLabel].forEach {
      contentView.addSubview($0)
    }
    
  }
  
  private func setConstraints() {
    let padding: CGFloat = 8
    let imageSize: CGFloat = 32
    
    titleImageView.snp.makeConstraints {
      $0.top.leading.equalToSuperview().offset(padding)
      $0.width.height.equalTo(imageSize)
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
      $0.leading.equalTo(titleImageView.snp.trailing).offset(padding)
    }
    
    timeLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(padding)
      $0.leading.equalTo(titleLabel.snp.leading)
    }
    
    contentsLabel.snp.makeConstraints {
      $0.top.equalTo(timeLabel.snp.bottom).offset(padding)
      $0.leading.equalTo(titleLabel.snp.leading)
    }
  }
  
  func configure(image: UIImage, title: String, time: String, contents: String) {
    titleImageView.image = image
    titleLabel.text = title
    timeLabel.text = time
    contentsLabel.text = contents
  }
}
