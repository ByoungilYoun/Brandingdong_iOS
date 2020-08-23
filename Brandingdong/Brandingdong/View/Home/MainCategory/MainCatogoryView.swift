//
//  MainCatogoryView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MainCatogoryView: UIView {
  // MARK: - Property
  
  private let categorySubLine: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  private let collectionLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    setCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    [collectionView, categorySubLine].forEach {
      self.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    collectionView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
    
    categorySubLine.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.height.equalTo(0.4)
    }
    
  }
  private func setCollectionView() {
    collectionLayout.scrollDirection = .horizontal
    collectionView.backgroundColor = .systemBackground
    
    let itemWidth: CGFloat = 60
    let itemHeight: CGFloat = 45
    let itemSpasing: CGFloat = 30
    let inset: CGFloat = 10
    let sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    
    collectionLayout.sectionInset = sectionInset
    collectionLayout.minimumInteritemSpacing = itemSpasing
    collectionLayout.minimumLineSpacing = itemSpasing
    collectionLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
    
    collectionView.dataSource = self
    collectionView.register(MainCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MainCategoryCollectionViewCell.identifier)
  }
  // MARK: - MainCategory Cell Configure
  
  private func categoryNameGet(indexPath: Int) -> String {
    return CategoryData.categoryMenuName[indexPath]
  }
}

// MARK: -
extension MainCatogoryView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return CategoryData.categoryMenuName.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCategoryCollectionViewCell.identifier, for: indexPath) as! MainCategoryCollectionViewCell
    cell.menuName.text = categoryNameGet(indexPath: indexPath.item)
    return cell
  }
}
