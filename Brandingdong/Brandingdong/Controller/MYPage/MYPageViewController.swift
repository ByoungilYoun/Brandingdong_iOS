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
  
  private let moveToTopButton : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(systemName: "arrow.up"), for: .normal)
    bt.tintColor = .black
    bt.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
    bt.layer.borderWidth = 1
    bt.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
    bt.addTarget(self, action: #selector(moveToTop), for: .touchUpInside)
    return bt
  }()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    setTableView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    resizeButton()
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [tableView,
     moveToTopButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    let buttonSize: CGFloat = 48
    
    tableView.snp.makeConstraints {
      $0.edges.equalTo(view.safeAreaLayoutGuide)
    }
    
    moveToTopButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-padding)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-padding)
      $0.width.height.equalTo(buttonSize)
    }
  }
  
  private func resizeButton() {
    moveToTopButton.layer.cornerRadius = moveToTopButton.frame.width / 2
    moveToTopButton.clipsToBounds = true
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    tableView.allowsSelection = false
    tableView.dataSource = self
    
    tableView.register(MypageTopTableViewCell.self,
                       forCellReuseIdentifier: MypageTopTableViewCell.identifier)
    
    tableView.register(MypageBannerTableViewCell.self,
                       forCellReuseIdentifier: MypageBannerTableViewCell.identifier)
    
    tableView.register(MypageMyShoppingTableViewCell.self,
                       forCellReuseIdentifier: MypageMyShoppingTableViewCell.identifier)
    
    tableView.register(MypageMyInfoTableViewCell.self,
                       forCellReuseIdentifier: MypageMyInfoTableViewCell.identifier)
  }
  
  // MARK: - NavigationBar
  
  private func setNavi() {
    
    navigationController?.navigationBar.isHidden = false
    
    navigationItem.title = "jwlee07"
    
    let imageIcon = UIImage(named: "마이페이지설정")?.withRenderingMode(.alwaysOriginal)
    

    let rightSetButton = UIBarButtonItem(
      image: imageIcon,
      style: .plain,
      target: self,
      action: #selector(didTapSetButton))
    
    navigationItem.rightBarButtonItem = rightSetButton
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.layoutIfNeeded()
  }
  
  // MARK: - Set Button Action
  
  @objc func moveToTop(view : UIViewController ){
    
  }
  @objc func didTapSetButton() {
    
  }
}

// MARK: - UITableViewDataSource

extension MYPageViewController: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.row {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: MypageTopTableViewCell.identifier,
                                               for: indexPath) as! MypageTopTableViewCell
      cell.delegate = self
      tableView.rowHeight = 102
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: MypageBannerTableViewCell.identifier,
                                               for: indexPath) as! MypageBannerTableViewCell
      tableView.rowHeight = 72
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(withIdentifier: MypageMyShoppingTableViewCell.identifier,
                                               for: indexPath) as! MypageMyShoppingTableViewCell
      cell.delegate = self
      tableView.rowHeight = Device.height / 3
      return cell
    case 3:
      let cell = tableView.dequeueReusableCell(withIdentifier: MypageMyInfoTableViewCell.identifier,
                                               for: indexPath) as! MypageMyInfoTableViewCell
      tableView.rowHeight = Device.height / 2.5
      return cell
    default:
      break
    }
    return UITableViewCell()
  }
}

// MARK: - MypageTopTableViewCellDelegate

extension MYPageViewController: MypageTopTableViewCellDelegate {
  func tapPointView() {
    let pointVC = PointViewController()
    navigationController?.pushViewController(pointVC, animated: true)
  }
}

// MARK: - MypageMyShoppingTableViewCellDelegate
extension MYPageViewController: MypageMyShoppingTableViewCellDelegate {
  func naviPushVC() {
    let shoppingBasketVC = ShoppingBasketViewController()
    shoppingBasketVC.view.backgroundColor = .systemBackground
    navigationController?.pushViewController(shoppingBasketVC, animated: true)
  }
}
