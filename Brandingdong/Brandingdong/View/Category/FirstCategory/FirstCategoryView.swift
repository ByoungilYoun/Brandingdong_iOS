//
//  FirstCategoryView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/07.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FirstCategoryView : UIView {
  
  //MARK: - Properties
  private let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  struct Standard {
    static let standard : CGFloat = 5
    static let inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  //MARK: - setUI()
  private func setUI() {
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.register(FirstCategoryCell.self, forCellWithReuseIdentifier: FirstCategoryCell.identifier)
    addSubview(collectionView)
  }
  
  //MARK: - setConstraint()
  private func setConstraint() {
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalToSuperview()
    }
  }
}

  //MARK: - UICollectionViewDataSource
extension FirstCategoryView : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    12
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCategoryCell.identifier, for: indexPath) as! FirstCategoryCell
    cell.backgroundColor = .red
    return cell
  }
}
  
  //MARK: - UICollectionViewDelegate
extension FirstCategoryView : UICollectionViewDelegate {
  
}
  
  //MARK: - UICollectionViewDelegateFlowLayout
extension FirstCategoryView : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    Standard.standard
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    Standard.inset
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 60, height: 50)
  }
}
