//
//  SecondTableViewCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol SecondTableViewCellDelegate : class {
  func handlePresent(cell : SecondTableViewCell)
}

class SecondTableViewCell : UITableViewCell {
  
  //MARK: - Properties
  
  static let identifier = "SecondTableViewCell"
  
  private let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  var delegate : SecondTableViewCellDelegate?
  
  var productImageArr: [UIImage] = [] {
    didSet {
      collectionView.reloadData()
    }
  }
  
  let fomatter = NumberFormatter()
  
  //MARK: - init
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
    setProductImages()
    priceFommater()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  struct Standard {
    static let standard : CGFloat = 5
    static let inset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
  }
  
  //MARK: - setUI()
  private func setUI() {
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.layer.cornerRadius = 10
    collectionView.register(CommonProductCollectionViewCell.self , forCellWithReuseIdentifier: CommonProductCollectionViewCell.identifer)
    contentView.addSubview(collectionView)
  }
  
  private func setConstraints() {
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalTo(contentView)
    }
  }
  // MARK: - setProductImages
  
  private func setProductImages() {
    for index in 0..<HomeInfoDatas.images.count {
      let url = URL(string: HomeInfoDatas.images[index])
      let data = try! Data(contentsOf: url!)
      productImageArr.append(UIImage(data: data)!)
    }
  }
  
  private func priceFommater() {
    fomatter.numberStyle = .decimal
    fomatter.minimumFractionDigits = 0
    fomatter.maximumFractionDigits = 3
  }
  
  // MARK: - CheckProduct Data
  
  private func checkProductPushData(productName: String) {
    
    for (_, value) in HomeInfoDatas.productNameAndImages[productName]! {
      let url = URL(string: value)
      let data = try! Data(contentsOf: url!)
      ProductInfo.checkProductNameImageArr.append(UIImage(data: data)!)
    }
    for (key, value) in HomeInfoDatas.productNameAndBrandNamePrice[productName]! {
      ProductInfo.checkProductName = productName
      ProductInfo.checkProductBrandName = key
      ProductInfo.checkProductPrice = value
    }
    for (key, value) in HomeInfoDatas.productNameAndBrandImageIntro[productName]! {
      ProductInfo.checkProductBrandIntro = key
      ProductInfo.checkProductBrandImage = value
    }
    
    for (key, value) in HomeInfoDatas.productIdAndName {
      if value == productName {
        Service.getProductOption(productId: key) { (isSucess) in
          guard isSucess else { return }
          self.delegate?.handlePresent(cell: self)
        }
        for (_, ImagesValue) in ProductInfoCategoryDatas.idAndInfoImages[key]! {
          let url = URL(string: ImagesValue)
          let data = try! Data(contentsOf: url!)
          ProductInfo.checkProductDetailImageArr.append(UIImage(data: data)!)
        }
      }
    }
  }
}

//MARK: - UICollectionViewDataSource
extension SecondTableViewCell : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return HomeInfoDatas.names.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonProductCollectionViewCell.identifer, for: indexPath) as! CommonProductCollectionViewCell
    cell.configure(image: productImageArr[indexPath.item],
                   company: HomeInfoDatas.brandNames[indexPath.item],
                   description: HomeInfoDatas.names[indexPath.item],
                   price: fomatter.string(from: HomeInfoDatas.price[indexPath.item] as NSNumber)!)
    cell.heartButton.tag = (indexPath.item + 1)
    return cell
  }
}

//MARK: - UICollectionViewDelegate
extension SecondTableViewCell : UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let didTapIndex = collectionView.cellForItem(at: indexPath) as? CommonProductCollectionViewCell {
      let checkProductName = didTapIndex.descriptionLabel.text!
      Favorite.checkRecentProductList.append(checkProductName)
      checkProductPushData(productName: checkProductName)
    }
  }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension SecondTableViewCell : UICollectionViewDelegateFlowLayout {
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
