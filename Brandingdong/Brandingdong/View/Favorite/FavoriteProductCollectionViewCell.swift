//
//  FavoriteProductCollectionViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FavoriteProductCollectionViewCell: UICollectionViewCell {
  // MARK: - Property
  
  static let identifer = "FavoriteProductCollectionViewCell"
  
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  private let allDeleteButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("전체삭제", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-regular", size: 16)
    return btn
  }()
  
  private let deviceWidth = UIScreen.main.bounds.width
  private let deviceHeight = UIScreen.main.bounds.height
  
  private var favoriteProductImageArr: [UIImage] = []
  private var favoriteProductBrandNameArr: [String] = []
  private var favoriteProductNameArr: [String] = []
  private var favoriteProductPriceArr: [Int] = []
  
  let fomatter = NumberFormatter()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    setLayout()
    setCollectionView()
    buttonAddTarget()
    favoriteProductAdd()
    priceFommater()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Set Property
  
  private func setLayout() {
    
    let itemSpacing: CGFloat = 0
    let lineSpacing: CGFloat = 32
    let sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
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
  
  private func priceFommater() {
    fomatter.numberStyle = .decimal
    fomatter.minimumFractionDigits = 0
    fomatter.maximumFractionDigits = 3
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [allDeleteButton,
     collectionView].forEach {
      contentView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    let padding: CGFloat = 16
    
    allDeleteButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-padding)
      $0.top.equalToSuperview()
    }
    collectionView.snp.makeConstraints {
      $0.top.equalTo(allDeleteButton.snp.bottom).offset(padding)
      $0.leading.bottom.trailing.equalToSuperview()
    }
  }
  
  // MARK: - favoriteProduct Info Add
  
  func favoriteProductAdd() {
    favoriteProductImageArr.removeAll()
    favoriteProductNameArr.removeAll()
    favoriteProductBrandNameArr.removeAll()
    favoriteProductPriceArr.removeAll()
    
    for (key, _) in HomeInfoDatas.productIdAndName {
      let id = key
      for index in Favorite.checkFavoriteProductList {
        if id == index {
          let url = URL(string: HomeInfoDatas.images[id])
          let data = try! Data(contentsOf: url!)
          favoriteProductImageArr.append(UIImage(data: data)!)
          favoriteProductNameArr.append(HomeInfoDatas.names[id])
          favoriteProductBrandNameArr.append(HomeInfoDatas.brandNames[id])
          favoriteProductPriceArr.append(HomeInfoDatas.price[id])
        }
      }
    }
  }
  
  // MARK: - DidTap AllDeleteButton
  
  private func buttonAddTarget() {
    allDeleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
  }
  
  @objc func didTapDeleteButton() {
    Favorite.checkFavoriteProductList.removeAll()
    favoriteProductAdd()
    collectionView.reloadData()
  }
}

extension FavoriteProductCollectionViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return Favorite.checkFavoriteProductList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonProductCollectionViewCell.identifer, for: indexPath) as! CommonProductCollectionViewCell
    
    cell.configure(
      image: favoriteProductImageArr[indexPath.item],
      company: favoriteProductBrandNameArr[indexPath.item],
      description: favoriteProductNameArr[indexPath.item],
      price: fomatter.string(from: favoriteProductPriceArr[indexPath.item] as NSNumber)!)
    
    cell.heartButton.tintColor = .systemRed
    return cell
  }
}
