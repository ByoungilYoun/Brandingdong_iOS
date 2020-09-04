//
//  ProductInfoViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoViewController: UIViewController {
  // MARK: - Property
  
  private let productInfoTableView = UITableView()
  private let deviceHeight = UIScreen.main.bounds.height
  
  private let buyButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("구매하기", for: .normal)
    btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    btn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return btn
  }()
  
  private let productImagesView = ProductImagesView()
  lazy var productInfoViewArr = [productImagesView]
  
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
    [productInfoTableView, buyButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let buttonHeight: CGFloat = 75
    
    [productInfoTableView, buyButton].forEach {
      $0.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
      }
    }
    
    buyButton.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.height.equalTo(buttonHeight)
    }
    
    productInfoTableView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.bottom.equalTo(buyButton.snp.top)
    }
    
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    productInfoTableView.allowsSelection = false
    productInfoTableView.dataSource = self
    productInfoTableView.delegate = self
    productInfoTableView.register(ProductInfoTableViewCell.self, forCellReuseIdentifier: ProductInfoTableViewCell.identifier)
  }
  
  // MARK: - NavigationBar
  
  private func setNavi() {
    
    navigationItem.title = "상품정보"
    
    let leftDismissButton = UIBarButtonItem(
      image: UIImage(systemName: "chevron.left"),
      style: .plain,
      target: self,
      action: #selector(didTapDismissButton))
    
    let rightBasketButton = UIBarButtonItem(
      image: UIImage(systemName: "cart"),
      style: .plain,
      target: self,
      action: #selector(didTapBasketButton))
    
    leftDismissButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    rightBasketButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    navigationItem.leftBarButtonItem = leftDismissButton
    navigationItem.rightBarButtonItem = rightBasketButton
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.layoutIfNeeded()
  }
  
  @objc private func didTapDismissButton(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
  
  @objc private func didTapBasketButton(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
  }
}

// MARK: - UITableViewDataSource

extension ProductInfoViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return productInfoViewArr.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let productInfoCell = productInfoTableView.dequeueReusableCell(withIdentifier: ProductInfoTableViewCell.identifier, for: indexPath) as! ProductInfoTableViewCell
    productInfoCell.productInfoCellView = productInfoViewArr[indexPath.row]
    switch indexPath.row {
    case 0:
      tableView.rowHeight = deviceHeight / 1.5
    default:
      break
    }
    return productInfoCell
  }
}

// MARK: - ProductInfoViewController

extension ProductInfoViewController: UITableViewDelegate {
  
}
