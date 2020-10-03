//
//  LocationInfoCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/03.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class LocationInfoCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "LocationInfoCell"
  
  private let mainTitle : UILabel = {
    let lb = UILabel()
    lb.text = "배송지 정보"
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    return lb
  }()
  
  private let inputButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("입력하기", for: .normal)
    bt.backgroundColor = .clear
    bt.setTitleColor(.systemBlue, for: .normal)
    return bt
  }()
  
  private let lineView : UIView = {
    let ln = UIView()
    ln.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    return ln
  }()
  
  private let explainationLabel : UILabel = {
    let lb = UILabel()
    lb.text = "기본 배송정보가 없습니다.\n입력하기를 누른 후 배송정보를 작성해주세요!"
    lb.textColor = .black
    lb.numberOfLines = 2
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  private let subExplainationLabel : UILabel = {
    let lb = UILabel()
    lb.text = "* 제주도, 도서 산간 지역 등은 배송이 하루 이상 추가 소요될 수 있습니다."
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.8)
    lb.font = UIFont.systemFont(ofSize: 12)
    return lb
  }()
  //MARK: - Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - configureUI()
  private func configureUI() {
    [mainTitle, inputButton, lineView, explainationLabel, subExplainationLabel].forEach {
      self.addSubview($0)
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
    
    explainationLabel.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(10)
      $0.leading.equalTo(self).offset(10)
    }
    
    subExplainationLabel.snp.makeConstraints {
      $0.top.equalTo(explainationLabel.snp.bottom).offset(5)
      $0.leading.equalTo(self).offset(10)
    }
  }
}
