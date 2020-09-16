//
//  BrandViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/13.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class BrandViewController : UIViewController {
  
  //MARK: - Properties
  private let tableView = UITableView()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
  }
  
  //MARK: - setUI()
  private func setUI() {
    view.backgroundColor = .systemBackground
    tableView.dataSource = self
    tableView.delegate = self
    tableView.allowsSelection = false
    tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: FirstTableViewCell.identifier)
    tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: SecondTableViewCell.identifier)
    tableView.register(ThirdTableViewCell.self, forCellReuseIdentifier: ThirdTableViewCell.identifier)
    view.addSubview(tableView)
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
}

  //MARK: - UITableViewDataSource
extension BrandViewController : UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: FirstTableViewCell.identifier, for: indexPath) as! FirstTableViewCell
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: SecondTableViewCell.identifier, for: indexPath) as! SecondTableViewCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: ThirdTableViewCell.identifier, for: indexPath)
      return cell
    }
  }
}

  //MARK: - UITableViewDelegate
extension BrandViewController : UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 0 {
      return view.frame.size.height / 1.5
    } else if indexPath.section == 1 {
      return 5920
    } else {
      return 600
    }
  }
}
