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
  
  let largeConfig = UIImage.SymbolConfiguration(pointSize: 24)
  
  lazy var favoriteButton: UIButton = {
    let btn = UIButton()
    btn.setImage(UIImage(systemName: "heart", withConfiguration: largeConfig), for: .normal)
    btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    btn.addTarget(self, action: #selector(didTapFavoriteButton), for: .touchUpInside)
    return btn
  }()
  
  private let moveTopButton: UIButton = {
    let btn = UIButton()
    btn.setImage(UIImage(systemName: "arrow.up"), for: .normal)
    btn.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    btn.layer.borderWidth = 2
    btn.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    return btn
  }()
  
  var toggle = false
  
  private let productImagesView = ProductImagesView()
  private let productInfoTitleView = ProductInfoTitleView()
  private let productInfoPointView = ProductInfoPointView()
  private let productInfoDiscountCouponView = ProductInfoDiscountCouponView()
  private let productInfoCategoryView = ProductInfoCategoryView()
  
  lazy var productInfoViewArr = [productImagesView,
                                 productInfoTitleView,
                                 productInfoPointView,
                                 productInfoDiscountCouponView,
                                 productInfoCategoryView]
  
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
    
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    [productInfoTableView,
     buyButton,
     moveTopButton,
     favoriteButton].forEach {
      view.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let buttonHeight: CGFloat = 72
    let margin: CGFloat = 8
    let buttonSize: CGFloat = 48
    
    [productInfoTableView,
     buyButton].forEach {
      $0.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
      }
    }
    
    buyButton.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.height.equalTo(buttonHeight)
    }
    
    favoriteButton.snp.makeConstraints {
      $0.centerY.equalTo(buyButton.snp.centerY)
      $0.trailing.equalTo(buyButton.snp.trailing).offset(-margin)
      $0.width.height.equalTo(buttonSize)
    }
    
    productInfoTableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.bottom.equalTo(buyButton.snp.top)
    }
    
    moveTopButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-margin)
      $0.bottom.equalTo(buyButton.snp.top).offset(-margin)
      $0.width.height.equalTo(buttonSize)
    }
    moveTopButton.clipsToBounds = true
    moveTopButton.layer.cornerRadius = buttonSize / 2
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    productInfoTableView.allowsSelection = false
    productInfoTableView.dataSource = self
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
  @objc private func didTapFavoriteButton(_ sender: UIButton) {
    if toggle {
      favoriteButton.setImage(UIImage(systemName: "heart.fill", withConfiguration: largeConfig), for: .normal)
      favoriteButton.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
      toggle = !toggle
    } else {
      favoriteButton.setImage(UIImage(systemName: "heart", withConfiguration: largeConfig), for: .normal)
      favoriteButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
      toggle = !toggle
    }
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
    
    let imageCellHeight: CGFloat = 532
    let titleCellHeight: CGFloat = 172
    let pointCellHeight: CGFloat = 86
    let discountCouponHeight: CGFloat = 86
    let categoryHeight: CGFloat = 700
    
    switch indexPath.row {
    case 0:
      tableView.rowHeight = imageCellHeight
    case 1:
      tableView.rowHeight = titleCellHeight
    case 2:
      tableView.rowHeight = pointCellHeight
    case 3:
      tableView.rowHeight = discountCouponHeight
    case 4:
      tableView.rowHeight = categoryHeight
    default:
      break
    }
    return productInfoCell
  }
}
