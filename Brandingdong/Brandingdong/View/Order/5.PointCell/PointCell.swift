//
//  PointCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PointCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "PointCell"
  
  private let mainTitle : UILabel = {
    let lb = UILabel()
    lb.text = "포인트 사용"
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    return lb
  }()
  
  private let havingPointLabel : UILabel = {
    let lb = UILabel()
    lb.text = "보유 포인트"
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.7)
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  var havingPoint : UILabel = {
    var lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  private let usingPointLabel : UILabel = {
    let lb = UILabel()
    lb.text = "사용 포인트"
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.7)
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  var usingPoint : UILabel = {
    var lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  private let lineView : UIView = {
    let ln = UIView()
    ln.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    return ln
  }()
  
  private let havingPointLabel2 : UILabel = {
    let lb = UILabel()
    lb.text = "보유 포인트"
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.7)
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  var havingPoint2 : UILabel = {
    var lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  var showingPointTextField : UITextField = {
    var tf = UITextField()
    tf.borderStyle = .roundedRect
    tf.textColor = .lightGray
    return tf
  }()
  
  private let usePointButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("전액사용", for: .normal)
    bt.setTitleColor(.white, for: .normal)
    bt.backgroundColor = .black
    bt.layer.cornerRadius = 5
    return bt
  }()
  
  private let descriptionLabel : UILabel = {
    let lb = UILabel()
    lb.text = "* 구매 금액의 50%만 포인트 사용 가능합니다."
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.7)
    lb.font = UIFont.systemFont(ofSize: 15)
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
    [mainTitle, havingPointLabel, havingPoint, usingPointLabel, usingPoint, lineView, havingPointLabel2, havingPoint2, showingPointTextField, usePointButton, descriptionLabel].forEach {
      contentView.addSubview($0)
    }
    
    mainTitle.snp.makeConstraints {
      $0.top.equalTo(self).offset(20)
      $0.leading.equalTo(self).offset(10)
    }
    
    havingPointLabel.snp.makeConstraints {
      $0.top.equalTo(mainTitle.snp.bottom).offset(15)
      $0.leading.equalTo(self).offset(10)
    }
    
    havingPoint.snp.makeConstraints {
      $0.top.equalTo(mainTitle.snp.bottom).offset(15)
      $0.leading.equalTo(havingPointLabel.snp.trailing).offset(5)
    }
    
    usingPointLabel.snp.makeConstraints {
      $0.top.equalTo(mainTitle.snp.bottom).offset(15)
      $0.leading.equalTo(havingPoint.snp.trailing).offset(10)
    }
    
    usingPoint.snp.makeConstraints {
      $0.top.equalTo(mainTitle.snp.bottom).offset(15)
      $0.leading.equalTo(usingPointLabel.snp.trailing).offset(10)
    }
    
    lineView.snp.makeConstraints {
      $0.top.equalTo(havingPointLabel.snp.bottom).offset(15)
      $0.leading.trailing.equalTo(self)
      $0.height.equalTo(1)
    }
    
    havingPointLabel2.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(20)
      $0.leading.equalTo(self).offset(10)
    }
    
    havingPoint2.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(20)
      $0.trailing.equalTo(self).offset(-10)
    }
    
    showingPointTextField.snp.makeConstraints {
      $0.top.equalTo(havingPointLabel2.snp.bottom).offset(15)
      $0.leading.equalTo(self).offset(10)
      $0.width.equalTo(250)
      $0.height.equalTo(40)
    }
    
    usePointButton.snp.makeConstraints {
      $0.top.equalTo(havingPoint2.snp.bottom).offset(15)
      $0.leading.equalTo(showingPointTextField.snp.trailing).offset(5)
      $0.trailing.equalTo(self).offset(-10)
      $0.height.equalTo(40)
    }
    
    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(showingPointTextField.snp.bottom).offset(5)
      $0.leading.equalTo(self).offset(10)
    }
  }
  
  //MARK: - configure
  func configure(havingPoint : String, usingPoint : String, havingPoint2 : String) {
    self.havingPoint.text = havingPoint
    self.usingPoint.text = usingPoint
    self.havingPoint2.text = havingPoint2
  }
  
}
