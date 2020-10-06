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
  private let purchaseVC = PurchaseViewController()
  private let blurView = UIView()
  
  var gesture : UITapGestureRecognizer?
  
  private let buyButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("구매하기", for: .normal)
    btn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    btn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    btn.addTarget(self, action: #selector(buyButtonClicked), for: .touchUpInside)
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
  
  private let productInfoCategoryTableViewCell = ProductInfoCategoryTableViewCell()
  
  var resultCategoryClick = ""
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    setTableView()
    addPurchaseView()
    addBlurView()
    addNotificationCenter()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    hideTabbar()
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
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
  
  private func addPurchaseView() {
    addChild(purchaseVC)
    view.addSubview(purchaseVC.view)
    purchaseVC.view.alpha = 0
    purchaseVC.view.isHidden = true
    purchaseVC.view.backgroundColor = .systemBackground
    purchaseVC.didMove(toParent: self)
    
    purchaseVC.view.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
      $0.height.equalTo(500)
    }
  }
  
  private func addBlurView() {
    blurView.alpha = 0
    blurView.isHidden = true
    blurView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
    view.addSubview(blurView)
    
    blurView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.bottom.equalTo(purchaseVC.view.snp.top)
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
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
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
  
  private func addNotificationCenter() {
    NotificationCenter.default.addObserver(self, selector: #selector(closeView(_:)), name: NSNotification.Name("CloseView"), object: nil)
    let gesture = UITapGestureRecognizer(target: self, action: #selector(closeView(_:)))
    view.addGestureRecognizer(gesture)
    self.gesture = gesture
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    productInfoTableView.allowsSelection = false
    productInfoTableView.dataSource = self
    productInfoTableView.delegate = self
    
    productInfoTableView.register(
      ProductImagesTableViewCell.self,
      forCellReuseIdentifier: ProductImagesTableViewCell.identifier)
    
    productInfoTableView.register(
      ProductInfoTitleTableViewCell.self,
      forCellReuseIdentifier: ProductInfoTitleTableViewCell.identifier)
    
    productInfoTableView.register(
      ProductInfoPointTableViewCell.self,
      forCellReuseIdentifier: ProductInfoPointTableViewCell.identifier)
    
    productInfoTableView.register(
      ProductInfoDiscountCouponTableViewCell.self,
      forCellReuseIdentifier: ProductInfoDiscountCouponTableViewCell.identifier)
    
    productInfoTableView.register(
      ProductInfoCategoryTableViewCell.self,
      forCellReuseIdentifier: ProductInfoCategoryTableViewCell.identifier)
    
    productInfoTableView.register(
      ProductInfoSellerAnotherProductTableViewCell.self,
      forCellReuseIdentifier: ProductInfoSellerAnotherProductTableViewCell.identifier)
    
    productInfoTableView.register(
      AnotherLikeProductTableViewCell.self,
      forCellReuseIdentifier: AnotherLikeProductTableViewCell.identifier)
  }
  
  // MARK: - NavigationBar
  
  private func setNavi() {
    
    navigationController?.navigationBar.isHidden = false
    
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
  
  //MARK: - HiddenTabar
  private func hideTabbar() {
    tabBarController?.tabBar.isHidden = true
  }
  // MARK: - keyboard Hidden
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    self.view.endEditing(true)
  }
  
  // MARK: - Create Alert
  
  private func createAlert(title: String?, message: String?, actions: [UIAlertAction]) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    for action in actions {
      alert.addAction(action)
    }
    present(alert, animated: true)
  }

  // MARK: - objc
  
  @objc private func didTapDismissButton(_ sender: UIBarButtonItem) {
    navigationController?.popViewController(animated: true)
    ProductInfo.checkProductNameImageArr.removeAll()
    ProductInfo.checkProductDetailImageArr.removeAll()
  }
  
  @objc private func didTapBasketButton(_ sender: UIBarButtonItem) {
    let shoppingBasketVC = ShoppingBasketViewController()
    shoppingBasketVC.view.backgroundColor = .systemBackground
    navigationController?.pushViewController(shoppingBasketVC, animated: true)
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
  
  @objc private func buyButtonClicked() {
    purchaseVC.view.alpha = 1
    purchaseVC.view.isHidden = false
    blurView.alpha = 1
    blurView.isHidden = false
  }
  
  @objc private func closeView(_ tapGestureRecognizer : UITapGestureRecognizer) {
    let location = tapGestureRecognizer.location(in: blurView)
    guard blurView.isHidden == false, blurView.bounds.contains(location) else {
      return
    }
    blurView.alpha = 0
    blurView.isHidden = true
    purchaseVC.view.alpha = 0
    purchaseVC.view.isHidden = true
  }
}

// MARK: - UITableViewDataSource

extension ProductInfoViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 4
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 4
    case 1:
      return 1
    case 2:
      return 1
    case 3:
      return 1
    default:
      break
    }
    return Int()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let imageCellHeight: CGFloat = 532
    let titleCellHeight: CGFloat = 172
    let pointCellHeight: CGFloat = 86
    let discountCouponHeight: CGFloat = 86
    var categoryHeight: CGFloat = 100 + (412 * CGFloat(ProductInfo.checkProductDetailImageArr.count))
    let sellerAnotherProductHeight: CGFloat = 642
    let anotherLikeHeight: CGFloat = 222

    
    switch resultCategoryClick {
    case "상품정보":
      categoryHeight = 100 + (412 * CGFloat(ProductInfo.checkProductDetailImageArr.count))
    case "리뷰":
      categoryHeight = 212
    case "Q&A":
      categoryHeight = 324
    case "주문정보":
      categoryHeight = 394
    default:
      break
    }
    
    switch indexPath.section {
    case 0:
      switch indexPath.row {
      case 0:
        tableView.rowHeight = imageCellHeight
        let cell = tableView.dequeueReusableCell(
          withIdentifier: ProductImagesTableViewCell.identifier,
          for: indexPath) as! ProductImagesTableViewCell
        return cell
      case 1:
        tableView.rowHeight = titleCellHeight
        let cell = tableView.dequeueReusableCell(
          withIdentifier: ProductInfoTitleTableViewCell.identifier,
          for: indexPath) as! ProductInfoTitleTableViewCell
        return cell
      case 2:
        tableView.rowHeight = pointCellHeight
        let cell = tableView.dequeueReusableCell(
          withIdentifier: ProductInfoPointTableViewCell.identifier,
          for: indexPath) as! ProductInfoPointTableViewCell
        return cell
      case 3:
        tableView.rowHeight = discountCouponHeight
        let cell = tableView.dequeueReusableCell(
          withIdentifier: ProductInfoDiscountCouponTableViewCell.identifier,
          for: indexPath) as! ProductInfoDiscountCouponTableViewCell
        return cell
      default:
        break
      }
    case 1:
      switch indexPath.row {
      case 0:
        tableView.rowHeight = categoryHeight
        let cell = tableView.dequeueReusableCell(
          withIdentifier: ProductInfoCategoryTableViewCell.identifier,
          for: indexPath) as! ProductInfoCategoryTableViewCell
        cell.infoDelegate = self
        return cell
      default:
        break
      }
    case 2:
      switch indexPath.row {
      case 0:
        tableView.rowHeight = sellerAnotherProductHeight
        let cell = tableView.dequeueReusableCell(
          withIdentifier: ProductInfoSellerAnotherProductTableViewCell.identifier,
          for: indexPath) as! ProductInfoSellerAnotherProductTableViewCell
        return cell
      default:
        break
      }
    case 3:
      switch indexPath.row {
      case 0:
        tableView.rowHeight = anotherLikeHeight
        let cell = tableView.dequeueReusableCell(
          withIdentifier: AnotherLikeProductTableViewCell.identifier,
          for: indexPath) as! AnotherLikeProductTableViewCell
        return cell
      default:
        break
      }
    default:
      break
    }
    return UITableViewCell()
  }
}

// MARK: - UITableViewDelegate

extension ProductInfoViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    return tableView.tableFooterView
  }
  
  private func tableView(_ tableView: UITableView, heightForFooteInSection section: Int) -> CGFloat {
    return 2
  }
}

// MARK: - ProductInfoCategoryTableViewCellDelegate

extension ProductInfoViewController: ProductInfoCategoryTableViewCellDelegate {

  func changeCategory(categoryName: String) {
    resultCategoryClick = categoryName
  }
}

