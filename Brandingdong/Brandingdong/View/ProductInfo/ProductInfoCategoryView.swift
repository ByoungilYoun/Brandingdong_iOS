//
//  ProductInfoCategoryView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/07.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoCategoryView: UIView {
  // MARK: - Property
  
  private let categoryMenuArr = ["상품정보", "리뷰", "Q&A", "주문정보"]
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  private let categoryMenuSubView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    return view
  }()
  
  private let tableView = UITableView()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setLayout()
    setCollectionView()
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
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
    
    collectionView.register(ProductInfoCategoryCollectionViewCell.self, forCellWithReuseIdentifier: ProductInfoCategoryCollectionViewCell.identifier)
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [collectionView,
     categoryMenuSubView,
     tableView].forEach {
      self.addSubview($0)
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
      $0.height.equalTo(1)
    }
  }
}
// MARK: -

extension ProductInfoCategoryView: UICollectionViewDataSource {
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

extension ProductInfoCategoryView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let didSelectCheckIndex = collectionView.cellForItem(at: indexPath) as? ProductInfoCategoryCollectionViewCell {
      UIView.animate(withDuration: 0.5) {
        didSelectCheckIndex.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        didSelectCheckIndex.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        didSelectCheckIndex.nameSubLine.isHidden = false
      }
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    if let didDeslectCheckIndex = collectionView.cellForItem(at: indexPath) as? ProductInfoCategoryCollectionViewCell {
      UIView.animate(withDuration: 0.5) {
        didDeslectCheckIndex.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        didDeslectCheckIndex.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        didDeslectCheckIndex.nameSubLine.isHidden = true
      }
    }
  }
}
