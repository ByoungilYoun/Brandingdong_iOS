//
//  MYPageViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MYPageViewController: UIViewController {
  // MARK: - Property
  
  private let tableView = UITableView()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    setTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [tableView].forEach {
      view.addSubview($0)
    }
  }
  
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    tableView.dataSource = self
    
    tableView.register(MypageTopTableViewCell.self,
                       forCellReuseIdentifier: MypageTopTableViewCell.identifier)
  }
}

// MARK: - UITableViewDataSource

extension MYPageViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MypageTopTableViewCell.identifier,
                                             for: indexPath) as! MypageTopTableViewCell
    return cell
  }
}
