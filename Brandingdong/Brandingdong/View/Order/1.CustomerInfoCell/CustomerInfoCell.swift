//
//  CustomerInfoCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/03.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CustomerInfoCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "CustomerInfoCell"
  
  private let mainTitle : UILabel = {
    let lb = UILabel()
    lb.text = "주문자 정보"
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    return lb
  }()
  
  private let subTitle : UILabel = {
    let lb = UILabel()
    lb.text = "주문자 정보를 입력해주세요"
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.5)
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  private let lineView : UIView = {
    let ln = UIView()
    ln.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    return ln
  }()
  
  private let nameLabel : UILabel = {
    let lb = UILabel()
    lb.text = "이름"
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 15)
    return lb
  }()
  
  private let phoneLabel : UILabel = {
    let lb = UILabel()
    lb.text = "휴대폰"
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 15)
    return lb
  }()
  
  private let emailLabel : UILabel = {
    let lb = UILabel()
    lb.text = "이메일"
    lb.textColor = .black
    lb.font = UIFont.systemFont(ofSize: 15)
    return lb
  }()
  
  private let nameTextField : UITextField = {
    let tf = UITextField()
    tf.placeholder = "이름"
    tf.borderStyle = .roundedRect
    return tf
  }()
  
  private let phoneTextField : UITextField = {
    let tf = UITextField()
    tf.placeholder = "휴대폰 번호를 입력하시오"
    tf.borderStyle = .roundedRect
    return tf
  }()
  
  private let emailTextField : UITextField = {
    let tf = UITextField()
    tf.placeholder = "이메일 주소"
    tf.borderStyle = .roundedRect
    tf.autocapitalizationType = .none
    return tf
  }()
  
  //MARK: - LifeCycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    [mainTitle, subTitle, lineView ,nameLabel, nameTextField, phoneLabel, phoneTextField, emailLabel, emailTextField].forEach {
      contentView.addSubview($0)
    }
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    mainTitle.snp.makeConstraints {
      $0.top.equalTo(self).offset(20)
      $0.leading.equalTo(self).offset(10)
    }
    
    subTitle.snp.makeConstraints {
      $0.top.equalTo(mainTitle.snp.bottom).offset(10)
      $0.leading.equalTo(self).offset(10)
    }

    lineView.snp.makeConstraints {
      $0.top.equalTo(subTitle.snp.bottom).offset(15)
      $0.height.equalTo(0.5)
      $0.leading.trailing.equalTo(self)
    }

    nameLabel.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(20)
      $0.leading.equalTo(self).offset(18)
      $0.width.equalTo(40)
    }

    nameTextField.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(15)
      $0.leading.equalTo(nameLabel.snp.trailing).offset(20)
      $0.trailing.equalTo(self).offset(-15)
      $0.height.equalTo(35)
    }

    phoneLabel.snp.makeConstraints {
      $0.top.equalTo(nameLabel.snp.bottom).offset(25)
      $0.leading.equalTo(self).offset(20)
    }

    phoneTextField.snp.makeConstraints {
      $0.top.equalTo(nameTextField.snp.bottom).offset(5)
      $0.leading.equalTo(phoneLabel.snp.trailing).offset(18)
      $0.trailing.equalTo(self).offset(-15)
      $0.height.equalTo(35)
    }

    emailLabel.snp.makeConstraints {
      $0.top.equalTo(phoneLabel.snp.bottom).offset(25)
      $0.leading.equalTo(self).offset(20)
    }

    emailTextField.snp.makeConstraints {
      $0.top.equalTo(phoneTextField.snp.bottom).offset(5)
      $0.leading.equalTo(emailLabel.snp.trailing).offset(18)
      $0.trailing.equalTo(self).offset(-15)
      $0.height.equalTo(35)
    }
    
  }
  
}
