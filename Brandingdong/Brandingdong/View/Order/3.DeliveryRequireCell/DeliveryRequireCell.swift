//
//  DeliveryRequireCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/03.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DeliveryRequireCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "DeliveryRequireCell"
  
  private let mainTitle : UILabel = {
    let lb = UILabel()
    lb.text = "배송 요청사항"
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    return lb
  }()
  
  private let inputButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("변경하기", for: .normal)
    bt.backgroundColor = .clear
    bt.setTitleColor(.systemBlue, for: .normal)
    return bt
  }()
  
  private let lineView : UIView = {
    let ln = UIView()
    ln.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    return ln
  }()
  
  private let subExplainationLabel : UILabel = {
    let lb = UILabel()
    lb.text = "배송 요청사항을 입력해주세요"
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.8)
    lb.font = UIFont.systemFont(ofSize: 13)
    return lb
  }()
  
  //MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - configureUI()
  private func configureUI() {
    [mainTitle, inputButton, lineView, subExplainationLabel].forEach {
      contentView.addSubview($0)
    }
    
    mainTitle.snp.makeConstraints {
      $0.top.equalTo(self).offset(20)
      $0.leading.equalTo(self).offset(10)
    }
    
    inputButton.snp.makeConstraints {
      $0.top.equalTo(self).offset(15)
      $0.trailing.equalTo(self).offset(-10)
      $0.width.equalTo(80)
      $0.height.equalTo(40)
    }
    
    lineView.snp.makeConstraints {
      $0.top.equalTo(mainTitle.snp.bottom).offset(20)
      $0.leading.trailing.equalTo(self)
      $0.height.equalTo(1)
    }
    
    subExplainationLabel.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(20)
      $0.leading.equalTo(self).offset(10)
    }
  }
  
}
