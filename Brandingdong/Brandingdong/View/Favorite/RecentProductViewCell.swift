//
//  FavoriteProductView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class RecentProductViewCell: UICollectionViewCell {
  // MARK: - Property
  
  static let identifer = "RecentProductViewCell"
  private let favoriteViewController = FavoriteViewController()
  
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  private let deviceWidth = UIScreen.main.bounds.width
  private let deviceHeight = UIScreen.main.bounds.height
  
  var recentProductArr: [String] = Favorite.checkRecentProductList
  
  private var recentProductImageArr: [UIImage] = []
  private var recentProductBrandNameArr: [String] = []
  private var recentProductNameArr: [String] = []
  private var recentProductPriceArr: [String] = []
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    setLayout()
    setCollectionView()
    recentProductAdd()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Set Property
  
  private func setLayout() {
    
    let itemSpacing: CGFloat = 0
    let lineSpacing: CGFloat = 32
    let sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 16)
    let itemWidth: CGFloat = (deviceWidth / 3) - (itemSpacing + sectionInset.left + sectionInset.right)
    let itemHeight: CGFloat = deviceHeight / 5
    
    layout.scrollDirection = .vertical
    layout.sectionInset = sectionInset
    layout.minimumLineSpacing = lineSpacing
    layout.minimumInteritemSpacing = itemSpacing
    layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
  }
  
  private func setCollectionView() {
    collectionView.backgroundColor = .systemBackground
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.layer.cornerRadius = 10
    collectionView.dataSource = self
    
    collectionView.register(CommonProductCollectionViewCell.self ,
                            forCellWithReuseIdentifier: CommonProductCollectionViewCell.identifer)
  }
  
  
  // MARK: - Setup Layout
  
  private func setUI() {
    contentView.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
  }
  
  // MARK: - recentProduct Info Add
  
  private func recentProductAdd() {
    for name in recentProductArr {
      for index in 0..<HomeInfoDatas.names.count {
        if HomeInfoDatas.names[index] == name {
          let url = URL(string: HomeInfoDatas.images[index])
          let data = try! Data(contentsOf: url!)
          recentProductImageArr.append(UIImage(data: data)!)
          recentProductNameArr.append(HomeInfoDatas.names[index])
          recentProductBrandNameArr.append(HomeInfoDatas.brandNames[index])
          recentProductPriceArr.append(String(HomeInfoDatas.price[index]))
        }
      }
    }
  }
}

extension RecentProductViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return recentProductArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonProductCollectionViewCell.identifer, for: indexPath) as! CommonProductCollectionViewCell
    
    cell.configure(
      image: recentProductImageArr[indexPath.item],
      company: recentProductBrandNameArr[indexPath.item],
      description: recentProductNameArr[indexPath.item],
      price: recentProductPriceArr[indexPath.item])
    
    return cell
  }
}
