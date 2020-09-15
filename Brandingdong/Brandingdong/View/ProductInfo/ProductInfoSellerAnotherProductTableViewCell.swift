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
  private let sellerImageView: UIImageView = {
    let igv = UIImageView()
    return igv
  }()
  
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
    sellerImageView.image = UIImage(named: "테스트4")
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
//    collectionView.dataSource = self
  }
  
  
  private func setConstraints() {
    
    let padding: CGFloat = 8
    let sellerInfoViewHeight: CGFloat = 212
    
    
    [sellerInfoView,
     collectionView].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
        $0.trailing.equalToSuperview().offset(-padding)
      }
    }
    
    sellerInfoView.snp.makeConstraints {
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
      $0.top.equalTo(sellerInfoView.snp.bottom).offset(padding)
      $0.bottom.equalTo(contentView.snp.bottom)
    }
    
    sellerImageView.clipsToBounds = true
    sellerImageView.layer.cornerRadius = sellerImageViewSize/2
  }
}

// MARK: - UICollectionViewDataSource
//extension ProductInfoSellerAnotherProductTableViewCell: UICollectionViewDataSource {
//  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//    return 4
//  }
//
//  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//    <#code#>
//  }
//}
