//
//  BrandSecondTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/18.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol BrandSecondTableViewCellDelegate : class {
  func handlePresent(cell : BrandSecondTableViewCell)
}

class BrandSecondTableViewCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "BrandSecondTableViewCell"
  
  private let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  

  var delegate : BrandSecondTableViewCellDelegate?

  var productImageArr: [UIImage] = [] {
    didSet {
      collectionView.reloadData()
    }
  }
  
  //MARK: - init
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
    setProductImages()
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
}

//MARK: - UICollectionViewDataSource
extension BrandSecondTableViewCell : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonProductCollectionViewCell.identifer, for: indexPath) as! CommonProductCollectionViewCell
    let randomProductImageArr = productImageArr.shuffled()
    let randomBrandNameArr = HomeInfoDatas.brandNames.shuffled()
    let randomNameArr = HomeInfoDatas.names.shuffled()
    let randomPriceArr = HomeInfoDatas.price.shuffled()
    cell.configure(image: randomProductImageArr[indexPath.item],
                   company: randomBrandNameArr[indexPath.item],
                   description: randomNameArr[indexPath.item],
                   price: String(randomPriceArr[indexPath.item]))
    return cell
  }
}

//MARK: - UICollectionViewDelegate
extension BrandSecondTableViewCell : UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    delegate?.handlePresent(cell: self)
  }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension BrandSecondTableViewCell : UICollectionViewDelegateFlowLayout {
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
