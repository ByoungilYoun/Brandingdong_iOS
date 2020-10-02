//
//  ProductDetailInfoTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductDetailInfoTableViewCell: UITableViewCell {
  // MARK: - Property
  
  private let deviceWidth = UIScreen.main.bounds.width
  let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  static let identifier = "ProductDetailInfoTableViewCell"
  
  // MARK: - Cell Init
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
    setLayout()
    setCollectionView()
  }
  
  // MARK: - Set LayOut
  
  private func setUI() {
    contentView.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalTo(contentView)
    }
  }
  
  private func setLayout() {
    let itemHeight: CGFloat = 412
    let itemSpasing: CGFloat = 0
    let lineSpasing: CGFloat = 0
    let sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    layout.scrollDirection = .vertical
    layout.sectionInset = sectionInset
    layout.minimumLineSpacing = lineSpasing
    layout.minimumInteritemSpacing = itemSpasing
    layout.itemSize = CGSize(width: deviceWidth, height: itemHeight)
  }

  
  private func setCollectionView() {
    collectionView.isScrollEnabled = false
    collectionView.allowsSelection = false
    collectionView.backgroundColor = .systemBackground
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.dataSource = self
    
    collectionView.register(ProductInfoImageCollectionViewCell.self,
                            forCellWithReuseIdentifier: ProductInfoImageCollectionViewCell.identifier)
  }
}

extension ProductDetailInfoTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return ProductInfo.checkProductDetailImageArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductInfoImageCollectionViewCell.identifier,
                                                  for: indexPath) as! ProductInfoImageCollectionViewCell
    cell.imageView.image = ProductInfo.checkProductDetailImageArr[indexPath.item]
    return cell
  }
}
