//
//  AnotherLikeProductTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class AnotherLikeProductTableViewCell: UITableViewCell {
  
  // MARK: - Property
  
  static let identifier = "AnotherLikeProductTableViewCell"
  private let deviceWidth = UIScreen.main.bounds.width

  
  let titleLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
    lb.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    lb.text = "함께보면 좋은 상품"
    return lb
  }()
  
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  struct Standard {
    static let standard : CGFloat = 8
    static let inset = UIEdgeInsets(top: 0, left: 5, bottom: 8, right: 5)
  }
  
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
    [titleLabel,
     collectionView].forEach {
      contentView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    
    titleLabel.snp.makeConstraints {
      $0.top.leading.equalToSuperview().offset(padding)
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(padding)
      $0.leading.equalToSuperview().offset(padding)
      $0.trailing.equalToSuperview().offset(-padding)
      $0.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Set CollectionView
  
  private func setLayout() {
    
    let width = deviceWidth - Standard.standard - (Standard.inset.left + Standard.inset.right)
    let realWidth = width / 3
    let height: CGFloat = 162
    
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = Standard.standard
    layout.minimumInteritemSpacing = Standard.standard
    layout.sectionInset = Standard.inset
    layout.itemSize = CGSize(width: realWidth, height: height)
  }
  
  private func setCollectionView() {
    
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.layer.cornerRadius = 10
    collectionView.register(CommonProductCollectionViewCell.self ,
                            forCellWithReuseIdentifier: CommonProductCollectionViewCell.identifer)
  }
}

// MARK: - UICollectionViewDataSource

extension AnotherLikeProductTableViewCell: UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CommonProductCollectionViewCell.identifer, for: indexPath) as! CommonProductCollectionViewCell
//    cell.configure(image: "brandi",
//                   company: "온더리버",
//                   description: "[자체제작] 웰메이드 레이온 원피스",
//                   price: "21,000")
    return cell
  }
}
