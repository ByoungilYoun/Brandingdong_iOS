//
//  PointBottonTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/01.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PointBottonTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "PointBottonTableViewCell"
  
  private let titleLabel: PointTopLabel = {
    let lb = PointTopLabel(title: "포인트 내역")
    return lb
  }()
  
  private let subTitleLabel: UILabel = {
    let lb = UILabel()
    lb.text = "* 최신 3개월 정보만 노출됩니다."
    lb.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 12)
    return lb
  }()
  
  private let tableView = UITableView()
  
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
     subTitleLabel,
     tableView].forEach {
      contentView.addSubview($0)
     }
    
  }
  
  private func setConstraints() {
    let padding: CGFloat = 16
    
    [titleLabel,
     subTitleLabel].forEach {
      $0.snp.makeConstraints {
        $0.top.equalToSuperview().offset(padding)
      }
     }
    
    titleLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(padding)
    }
    
    subTitleLabel.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-padding)
    }
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}
