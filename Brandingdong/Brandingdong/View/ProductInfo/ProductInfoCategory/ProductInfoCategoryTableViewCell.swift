//
//  ProductInfoCategoryView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/07.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol ProductInfoCategoryTableViewCellDelegate {
  func changeCategory(categoryName: String)
}

class ProductInfoCategoryTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "ProductInfoCategoryTableViewCell"
  
  private let categoryButtonView = UIView()
  
  private let productInfoButton: CategoryMenuButton = {
    let btn = CategoryMenuButton(title: "상품정보")
    return btn
  }()
  
  private let reviewButton: CategoryMenuButton = {
    let btn = CategoryMenuButton(title: "리뷰")
    return btn
  }()
  
  private let qaButton: CategoryMenuButton = {
    let btn = CategoryMenuButton(title: "Q&A")
    return btn
  }()
  
  private let deliverInfoButton: CategoryMenuButton = {
    let btn = CategoryMenuButton(title: "주문정보")
    return btn
  }()
  
  private let categoryMoveView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    return view
  }()
  
  private let categoryMenuSubView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    return view
  }()
  
  private let tableView = UITableView()
  var infoDelegate: ProductInfoCategoryTableViewCellDelegate?
  
  var categoryClick: String = "" {
    didSet {
      infoDelegate?.changeCategory(categoryName: categoryClick)
      tableView.reloadData()
    }
  }
  
  
  // MARK: - Cell init
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
    setTableView()
    setTargetButton()
  }
  
  // MARK: - Set Property
  
  private func setTableView() {
    tableView.isScrollEnabled = false
    tableView.allowsSelection = false
    tableView.dataSource = self
    tableView.rowHeight = 272
    tableView.isScrollEnabled = false
    
    tableView.register(
      ProductDetailInfoTableViewCell.self,
      forCellReuseIdentifier: ProductDetailInfoTableViewCell.identifier)
    
    tableView.register(
      ReViewTableViewCell.self,
      forCellReuseIdentifier: ReViewTableViewCell.identifier)
    
    tableView.register(
      QATableViewCell.self,
      forCellReuseIdentifier: QATableViewCell.identifier)
    
    tableView.register(
      OrderInfoTableViewCell.self,
      forCellReuseIdentifier: OrderInfoTableViewCell.identifier)
    
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [categoryButtonView,
     categoryMenuSubView,
     tableView].forEach {
      contentView.addSubview($0)
     }
    
    [productInfoButton,
     reviewButton,
     qaButton,
     deliverInfoButton,
     categoryMoveView].forEach {
      categoryButtonView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    let categoryButtonHeight: CGFloat = 72
    let subviewPadding: CGFloat = 8
    
    [categoryButtonView,
     categoryMenuSubView,
     tableView].forEach {
      $0.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
      }
     }
    categoryButtonView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.height.equalTo(categoryButtonHeight)
    }
    
    [productInfoButton,
     reviewButton,
     qaButton,
     deliverInfoButton].forEach {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(categoryButtonView.snp.centerY)
        $0.width.equalToSuperview().multipliedBy(0.25)
      }
     }
    
    productInfoButton.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
    
    reviewButton.snp.makeConstraints {
      $0.leading.equalTo(productInfoButton.snp.trailing)
    }
    
    qaButton.snp.makeConstraints {
      $0.leading.equalTo(reviewButton.snp.trailing)
    }
    
    deliverInfoButton.snp.makeConstraints {
      $0.leading.equalTo(qaButton.snp.trailing)
    }
    
    categoryMoveView.snp.makeConstraints {
      $0.top.equalTo(productInfoButton.snp.bottom)
      $0.width.equalTo(productInfoButton)
      $0.leading.equalToSuperview().offset(0)
      $0.height.equalTo(2)
    }
    
    categoryMenuSubView.snp.makeConstraints {
      $0.top.equalTo(categoryButtonView.snp.bottom).offset(-subviewPadding)
      $0.height.equalTo(0.5)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(categoryMenuSubView.snp.bottom)
      $0.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Action Button
  
  private func setTargetButton() {
    [productInfoButton,
     reviewButton,
     qaButton,
     deliverInfoButton].forEach {
      $0.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
     }
  }
  
  private func getMoveButtonTarget(buttonName: UIButton) {
    
    categoryMoveView.snp.removeConstraints()
    
    UIView.animate(withDuration: 0.5) { [self] in
      categoryMoveView.snp.makeConstraints {
        $0.top.equalTo(buttonName.snp.bottom)
        $0.width.equalTo(buttonName)
        $0.leading.equalTo(buttonName.snp.leading)
        $0.height.equalTo(2)
      }
      self.layoutIfNeeded()
    }
  }
  
  @objc func didTapButton(sender: UIButton) {
    switch sender {
    case productInfoButton:
      categoryClick = "상품정보"
      getMoveButtonTarget(buttonName: productInfoButton)
      
    case reviewButton:
      categoryClick = "리뷰"
      getMoveButtonTarget(buttonName: reviewButton)
    
    case qaButton:
      categoryClick = "Q&A"
      getMoveButtonTarget(buttonName: qaButton)
      
    case deliverInfoButton:
      categoryClick = "주문정보"
      getMoveButtonTarget(buttonName: deliverInfoButton)
      
    default:
      break
    }
  }
}

// MARK: - UITableViewDataSource

extension ProductInfoCategoryTableViewCell: UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch categoryClick {
    case "", "상품정보":
      let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailInfoTableViewCell.identifier,
                                               for: indexPath)
      tableView.rowHeight = 100 + (412 * CGFloat(ProductInfo.checkProductDetailImageArr.count))
      return cell
    case "리뷰":
      let cell = tableView.dequeueReusableCell(withIdentifier: ReViewTableViewCell.identifier,
                                               for: indexPath)
      return cell
    case "Q&A":
      let cell = tableView.dequeueReusableCell(withIdentifier: QATableViewCell.identifier,
                                               for: indexPath)
      return cell
    case "주문정보":
      let cell = tableView.dequeueReusableCell(withIdentifier: OrderInfoTableViewCell.identifier,
                                               for: indexPath)
      return cell
    default:
      break
    }
    return UITableViewCell()
  }
}
