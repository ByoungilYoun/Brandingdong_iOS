//
//  MethodToPayCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class HowToPayCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "MethodToPay"
  
  private let mainTitle : UILabel = {
    let lb = UILabel()
    lb.text = "결제수단"
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    return lb
  }()
  
  var howToPayLabel : UILabel = {
    var lb = UILabel()
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.6)
    lb.font = UIFont.systemFont(ofSize: 16)
    return lb
  }()
  
  private let lineView : UIView = {
    let ln = UIView()
    ln.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    return ln
  }()
  
  private let tableView = UITableView()
  
  var methods = ["네이버페이", "카카오페이", "토스", "신용/체크카드", "무통장 입금", "휴대폰 결제"]
  
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
    tableView.dataSource = self
    tableView.delegate = self
    tableView.allowsSelection = false 
    tableView.register(MethodToPayCell.self, forCellReuseIdentifier: MethodToPayCell.identifier)
    
    [mainTitle, howToPayLabel, lineView ,tableView].forEach {
      contentView.addSubview($0)
    }
    
    mainTitle.snp.makeConstraints {
      $0.top.equalTo(self).offset(20)
      $0.leading.equalTo(self).offset(10)
    }
    
    howToPayLabel.snp.makeConstraints {
      $0.top.equalTo(mainTitle.snp.bottom).offset(10)
      $0.leading.equalTo(self).offset(10)
    }
    
    lineView.snp.makeConstraints {
      $0.top.equalTo(howToPayLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalTo(self)
      $0.height.equalTo(1)
    }
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom)
      $0.leading.trailing.equalTo(self)
      $0.bottom.equalTo(self)
    }
  }
  
  func configure(howToPay : String) {
    howToPayLabel.text = howToPay
  }
}

extension HowToPayCell : UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MethodToPayCell.identifier, for: indexPath) as! MethodToPayCell
    cell.configure(method: methods[indexPath.row])
    return cell 
  }
}

extension HowToPayCell : UITableViewDelegate {
  
}
