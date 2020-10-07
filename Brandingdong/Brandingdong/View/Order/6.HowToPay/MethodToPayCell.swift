//
//  MethodToPayCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol MethodToPayCellDelegate : class {
  func clickMethodButton (_ cell : MethodToPayCell)
}

class MethodToPayCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "MethodToPayCell"
  
  private let methodButton : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(systemName: "smallcircle.fill.circle"), for: .normal)
    bt.tintColor = .lightGray
    bt.addTarget(self, action: #selector(methodButtonClicked), for: .touchUpInside)
    return bt
  }()
  
  var methodLabel : UILabel = {
    var lb = UILabel()
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  var delegate : MethodToPayCellDelegate?
  //MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    configureUI()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureUI() {
    [methodButton, methodLabel].forEach {
      contentView.addSubview($0)
    }
    
    methodButton.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(self).offset(15)
    }
    
    methodLabel.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(methodButton.snp.trailing).offset(10)
    }
  }
  
  func configure(method : String) {
    methodLabel.text = method
  }
  
  @objc func methodButtonClicked() {
    delegate?.clickMethodButton(self)
  }
}
