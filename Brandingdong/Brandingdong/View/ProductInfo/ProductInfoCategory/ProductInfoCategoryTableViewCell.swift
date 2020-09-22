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
  
  private let categoryMenuArr = ["상품정보", "리뷰", "Q&A", "주문정보"]
  
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  private let categoryMenuSubView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    return view
  }()
  
  private let tableView = UITableView()
  var delegate: ProductInfoCategoryTableViewCellDelegate?
  
  var categoryClick: String = "" {
    didSet {
      print ("categoryClick : ", categoryClick)
      delegate?.changeCategory(categoryName: categoryClick)
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
    setLayout()
    setCollectionView()
    setTableView()
  }
  
  // MARK: - Set Property
  
  private func setLayout() {
    
    let itemSize: CGFloat = 50
    let lineSpasing: CGFloat = 32
    let sectionInset = UIEdgeInsets(top: 10, left: 32, bottom: 10, right: 32)
    
    layout.scrollDirection = .horizontal
    layout.sectionInset = sectionInset
    layout.minimumLineSpacing = lineSpasing
    layout.itemSize = CGSize(width: itemSize, height: itemSize)
  }
  
  private func setCollectionView() {
    collectionView.backgroundColor = .systemBackground
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(
      ProductInfoCategoryCollectionViewCell.self,
      forCellWithReuseIdentifier: ProductInfoCategoryCollectionViewCell.identifier)
  }
  
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
    [collectionView,
     categoryMenuSubView,
     tableView].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let collectionViewHeight: CGFloat = 72
    let subviewPadding: CGFloat = 10
    
    [collectionView,
     categoryMenuSubView,
     tableView].forEach {
      $0.snp.makeConstraints {
        $0.leading.trailing.equalToSuperview()
      }
    }
    collectionView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.height.equalTo(collectionViewHeight)
    }
    categoryMenuSubView.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom).offset(-subviewPadding)
      $0.height.equalTo(0.5)
    }
    tableView.snp.makeConstraints {
      $0.top.equalTo(categoryMenuSubView.snp.bottom)
      $0.bottom.equalToSuperview()
    }
  }
}

// MARK: - UICollectionViewDataSource

extension ProductInfoCategoryTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryMenuArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductInfoCategoryCollectionViewCell.identifier, for: indexPath) as! ProductInfoCategoryCollectionViewCell
    
    cell.menuName.text = categoryMenuArr[indexPath.item]
    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension ProductInfoCategoryTableViewCell: UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let didSelectCheckIndex = collectionView.cellForItem(at: indexPath) as? ProductInfoCategoryCollectionViewCell {
      didSelectCheckIndex.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
      didSelectCheckIndex.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
      didSelectCheckIndex.nameSubLine.isHidden = false
      categoryClick = didSelectCheckIndex.menuName.text!
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    if let didDeslectCheckIndex = collectionView.cellForItem(at: indexPath) as? ProductInfoCategoryCollectionViewCell {
      didDeslectCheckIndex.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
      didDeslectCheckIndex.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      didDeslectCheckIndex.nameSubLine.isHidden = true
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
