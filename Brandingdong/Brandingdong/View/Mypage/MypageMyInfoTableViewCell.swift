//
//  MypageMyInfoTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/30.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MypageMyInfoTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "MypageMyInfoTableViewCell"
  
  private let titleLabel: UILabel = {
    let lb = UILabel()
    lb.text = "MY알림"
    lb.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
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
    setTableView()
  }
  
  // MARK: - Set LayOut
  
  private func setUI() {
    [titleLabel,
     tableView].forEach {
      contentView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    let titleLabelHeight: CGFloat = 52
    let padding: CGFloat = 8
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
      $0.leading.equalToSuperview().offset(padding)
      $0.height.equalTo(titleLabelHeight)
    }
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(padding)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Set Property
  
  private func setTableView() {
    tableView.allowsSelection = false
    tableView.dataSource = self
    
    tableView.register(MypageMyInfoSubTableViewCell.self,
                       forCellReuseIdentifier: MypageMyInfoSubTableViewCell.identifier)
  }
}

extension MypageMyInfoTableViewCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return Imsi.contentsArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MypageMyInfoSubTableViewCell.identifier,
                                             for: indexPath) as! MypageMyInfoSubTableViewCell
    let image = UIImage(named: "마이페이지로고")
    cell.configure(image: image!,
                   title: "브랜디",
                   time: "5 시간 전",
                   contents: Imsi.contentsArr[indexPath.row])
    
    tableView.rowHeight = ((Device.height / 2.5) - 68) / CGFloat(Imsi.contentsArr.count)
    return cell
  }
}
