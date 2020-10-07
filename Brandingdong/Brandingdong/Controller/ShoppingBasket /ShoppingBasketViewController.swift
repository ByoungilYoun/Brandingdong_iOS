//
//  ShoppingBasketViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/01.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ShoppingBasketViewController: UIViewController {
  // MARK: - Property
  
  private let tableView = UITableView()
  
  private let moveTopButton: UIButton = {
    let btn = UIButton()
    btn.setImage(UIImage(systemName: "arrow.up"), for: .normal)
    btn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    btn.layer.borderWidth = 2
    btn.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    return btn
  }()
  
  private let buyButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("구매하기", for: .normal)
    btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    btn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return btn
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
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [tableView,
     moveTopButton,
     buyButton].forEach {
      view.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 8
    let buttonSize: CGFloat = 48
    let buttonHeight: CGFloat = 72
    
    buyButton.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
      $0.height.equalTo(buttonHeight)
    }
    
    moveTopButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-padding)
      $0.bottom.equalTo(buyButton.snp.top).offset(-padding)
      $0.width.height.equalTo(buttonSize)
    }
    
    tableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(buyButton.snp.top)
    }
    moveTopButton.clipsToBounds = true
    moveTopButton.layer.cornerRadius = buttonSize / 2
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.allowsSelection = false
    
    tableView.register(AllProductControlButtonTableViewCell.self,
                       forCellReuseIdentifier: AllProductControlButtonTableViewCell.identifier)
    
    tableView.register(DeliverProductTableViewCell.self,
                       forCellReuseIdentifier: DeliverProductTableViewCell.identifier)
  }
  
  
  // MARK: - NavigationBar
  
  private func setNavi() {
    
    navigationController?.navigationBar.isHidden = false
    
    navigationItem.title = "장바구니"
    
    let leftDismissButton = UIBarButtonItem(
      image: UIImage(systemName: "chevron.left"),
      style: .plain,
      target: self,
      action: #selector(didTapDismissButton))
    
    leftDismissButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.layoutIfNeeded()
  }
  
  // MARK: - Action Button
  
  @objc func didTapDismissButton(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func didTapButtonCheck(_ sender: UIButton) {
    switch sender {
    case moveTopButton:
      print ("moveTopButton")
    case buyButton:
      print ("buyButton")
      
    default:
      break
    }
  }
}

// MARK: - UITableViewDataSource

extension ShoppingBasketViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return 1
    default:
      break
    }
    return Int()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(withIdentifier: AllProductControlButtonTableViewCell.identifier,
                                               for: indexPath) as! AllProductControlButtonTableViewCell
      tableView.rowHeight = 52
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliverProductTableViewCell.identifier,
                                               for: indexPath) as! DeliverProductTableViewCell
      tableView.rowHeight = UIScreen.main.bounds.height - 172
      return cell
    default:
      break
    }
    return UITableViewCell()
  }
}

// MARK: - UITableViewDelegate

extension ShoppingBasketViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return tableView.tableFooterView
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 2
  }
}
