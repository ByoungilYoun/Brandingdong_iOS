//
//  FavoriteProductView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class RecentProductCollectionViewCell: UICollectionViewCell {
  // MARK: - Property
  
  static let identifer = "RecentProductViewCell"
  
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
  
  var recentProductArr: [String] = Favorite.checkRecentProductList
  
  private var recentProductImageArr: [UIImage] = []
  private var recentProductBrandNameArr: [String] = []
  private var recentProductNameArr: [String] = []
  private var recentProductPriceArr: [Int] = []
  
  let fomatter = NumberFormatter()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    setLayout()
    setCollectionView()
    buttonAddTarget()
    recentProductAdd()
    priceFommater()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Set Property
  
  private func setLayout() {
    
    let itemSpacing: CGFloat = 0
    let lineSpacing: CGFloat = 32
    let sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
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
  
  // MARK: - recentProduct Info Add
  
  private func recentProductAdd() {
    print ("recentProductAdd")
    for name in recentProductArr {
      for index in 0..<HomeInfoDatas.names.count {
        if HomeInfoDatas.names[index] == name {
          let url = URL(string: HomeInfoDatas.images[index])
          let data = try! Data(contentsOf: url!)
          recentProductImageArr.append(UIImage(data: data)!)
          recentProductNameArr.append(HomeInfoDatas.names[index])
          recentProductBrandNameArr.append(HomeInfoDatas.brandNames[index])
          recentProductPriceArr.append(HomeInfoDatas.price[index])
        }
      }
    }
  }
  
  // MARK: - DidTap AllDeleteButton
  
  private func buttonAddTarget() {
    allDeleteButton.addTarget(self, action: #selector(didTapDeleteButton), for: .touchUpInside)
  }
  
  @objc func didTapDeleteButton() {
    print ("didTapDeleteButton")
    Favorite.checkRecentProductList.removeAll()
    print ("Favorite.checkRecentProductList : ", Favorite.checkRecentProductList)
    recentProductAdd()
    collectionView.reloadData()
  }
}

extension RecentProductCollectionViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    print ("numberOfItemsInSection")
    return recentProductArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    print ("cellForItemAt")
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonProductCollectionViewCell.identifer, for: indexPath) as! CommonProductCollectionViewCell
    
    cell.configure(
      image: recentProductImageArr[indexPath.item],
      company: recentProductBrandNameArr[indexPath.item],
      description: recentProductNameArr[indexPath.item],
      price: fomatter.string(from: recentProductPriceArr[indexPath.item] as NSNumber)!)
    return cell
  }
}

