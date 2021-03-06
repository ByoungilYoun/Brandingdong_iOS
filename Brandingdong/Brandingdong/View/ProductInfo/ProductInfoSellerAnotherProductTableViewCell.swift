//
//  ProductInfoSellerAnotherProductView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/11.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductInfoSellerAnotherProductTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  static let identifier = "ProductInfoSellerAnotherProductTableViewCell"
  
  private let sellerInfoView = UIView()
  private let sellerImageView = UIImageView()
  
  private let sellerNickName: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 24)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "판매자 닉네임"
    return lb
  }()
  
  private let sellerSubNickName: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "판매자 서브 닉네임"
    return lb
  }()
  
  private let deviceWidth = UIScreen.main.bounds.width
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  struct Standard {
    static let standard : CGFloat = 5
    static let inset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
  }
  
  private var sellerAnotherProductImageArr: [UIImage] = [] {
    didSet {
      collectionView.reloadData()
    }
  }
  private var sellerAnotherBrandNameArr: [String] = []
  private var sellerAnotherNameArr: [String] = []
  private var sellerAnotherPriceArr: [String] = []
  
  // MARK: - Cell init
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    productTitleInit()
    setUI()
    setConstraints()
    setLayout()
    setCollectionView()
    setSellerProductItems()
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [sellerInfoView,
     collectionView].forEach {
      contentView.addSubview($0)
    }
    
    [sellerImageView,
     sellerNickName,
     sellerSubNickName].forEach {
      sellerInfoView.addSubview($0)
    }
  }
  
  // MARK: - Set Property
  
  private func setLayout() {
    
    let itemSpacing: CGFloat = 8
    let sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    let itemWidth: CGFloat = (deviceWidth / 2) - (itemSpacing + sectionInset.left + sectionInset.right)
    let itemHeight: CGFloat = 234
    
    
    layout.scrollDirection = .vertical
    layout.sectionInset = sectionInset
    layout.minimumInteritemSpacing = itemSpacing
    layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
  }
  
  private func setCollectionView() {
    collectionView.backgroundColor = .systemBackground
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.dataSource = self
    collectionView.layer.cornerRadius = 10
    
    collectionView.register(CommonProductCollectionViewCell.self , forCellWithReuseIdentifier: CommonProductCollectionViewCell.identifer)
  }
  
  
  private func setConstraints() {
    
    let padding: CGFloat = 8
    let sellerInfoViewHeight: CGFloat = 154
    
    
    [sellerInfoView,
     collectionView].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
        $0.trailing.equalToSuperview().offset(-padding)
      }
    }
    
    sellerInfoView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
      $0.height.equalTo(sellerInfoViewHeight)
    }
    
    let sellerImageViewSize: CGFloat = 64
    
    [sellerImageView,
     sellerNickName,
     sellerSubNickName].forEach {
      $0.snp.makeConstraints {
        $0.centerX.equalTo(sellerInfoView.snp.centerX)
      }
    }
    sellerImageView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
      $0.width.height.equalTo(sellerImageViewSize)
    }
    
    sellerNickName.snp.makeConstraints {
      $0.top.equalTo(sellerImageView.snp.bottom).offset(padding)
    }
    
    sellerSubNickName.snp.makeConstraints {
      $0.top.equalTo(sellerNickName.snp.bottom).offset(padding)
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(sellerInfoView.snp.bottom)
      $0.bottom.equalTo(contentView.snp.bottom)
    }
    
    sellerImageView.clipsToBounds = true
    sellerImageView.layer.cornerRadius = sellerImageViewSize/2
    sellerImageView.layer.borderWidth = 1
    sellerImageView.layer.borderColor = UIColor.lightGray.cgColor
  }
  
  // MARK: - Set Value Image
  
  private func setSellerProductItems() {
    for index in 0..<4 {
      let url = URL(string: HomeInfoDatas.images[index + 10])
      let data = try! Data(contentsOf: url!)
      sellerAnotherProductImageArr.append(UIImage(data: data)!)
      sellerAnotherNameArr.append(HomeInfoDatas.names[index + 10])
      sellerAnotherPriceArr.append(String(HomeInfoDatas.price[index + 10]))
      sellerAnotherBrandNameArr.append(HomeInfoDatas.brandNames[index + 10])
    }
  }
  
  private func productTitleInit() {
    sellerNickName.text = ProductInfo.checkProductBrandName
    sellerSubNickName.text = ProductInfo.checkProductBrandIntro
    
    let url = URL(string: ProductInfo.checkProductBrandImage)
    let data = try! Data(contentsOf: url!)
    sellerImageView.image = UIImage(data: data)
  }
}

// MARK: - UICollectionViewDataSource

extension ProductInfoSellerAnotherProductTableViewCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonProductCollectionViewCell.identifer, for: indexPath) as! CommonProductCollectionViewCell
    cell.configure(image: sellerAnotherProductImageArr[indexPath.item],
                   company: sellerAnotherBrandNameArr[indexPath.item],
                   description: sellerAnotherNameArr[indexPath.item],
                   price: sellerAnotherPriceArr[indexPath.item])
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ProductInfoSellerAnotherProductTableViewCell : UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return Standard.inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = self.frame.size.width - Standard.standard - (Standard.inset.left + Standard.inset.right)
    let realWidth = width / 2
    let height : CGFloat = 230
    return CGSize(width: realWidth, height: height)
  }
}
