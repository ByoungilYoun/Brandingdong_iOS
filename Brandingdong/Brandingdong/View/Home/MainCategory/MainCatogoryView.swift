//
//  MainCategoryView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
protocol ChangeViewDelegate {
  func changeView(index : Int)
}

class MainCategoryView: UIView {
  // MARK: - Property
  
  private let categorySubLine: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  private let collectionLayout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
  
  var delegate : ChangeViewDelegate?
  var previouslySelectedIndexPath : NSIndexPath?
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    setCollectionView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    [collectionView, categorySubLine].forEach {
      self.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    collectionView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
    
    categorySubLine.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(collectionView.snp.bottom)
      $0.height.equalTo(0.4)
    }
  }
  
  private func setCollectionView() {
    
    
    let itemCellSpasing: CGFloat = 10
    let itemLineSpasing: CGFloat = 5
    let inset: CGFloat = 0
    let sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    let itemWidth: CGFloat = (UIScreen.main.bounds.width - (2 * itemCellSpasing)) / 3
    let itemHeight: CGFloat = 50
    
    collectionLayout.sectionInset = sectionInset
    collectionLayout.minimumInteritemSpacing = itemCellSpasing
    collectionLayout.minimumLineSpacing = itemLineSpasing
    collectionLayout.itemSize = CGSize(width: itemWidth, height: itemHeight)
    
    collectionLayout.scrollDirection = .horizontal
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.backgroundColor = .white
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(MainCategoryCollectionViewCell.self, forCellWithReuseIdentifier: MainCategoryCollectionViewCell.identifier)
  }
  
  // MARK: - MainCategory Cell Configure
  
  private func categoryNameGet(indexPath: Int) -> String {
    return CategoryData.categoryMenuName[indexPath]
  }
}

// MARK: - UICollectionViewDataSource
extension MainCategoryView: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return CategoryData.categoryMenuName.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCategoryCollectionViewCell.identifier, for: indexPath) as! MainCategoryCollectionViewCell
    cell.menuName.text = categoryNameGet(indexPath: indexPath.item)
    
//    if indexPath.row == 0 {
//      cell.isSelected = true
//
//    }
//
//    if cell.isSelected == true {
//      cell.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//    } else {
//      cell.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    }
//    return cell
    if indexPath.row == 0 {
      cell.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
      cell.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
      cell.nameSubLine.isHidden = false
    } else if indexPath.row == 1 {
      cell.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    } else {
      cell.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension MainCategoryView: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    if previouslySelectedIndexPath != nil {
//      let previousCell = collectionView.cellForItem(at: previouslySelectedIndexPath! as IndexPath) as! MainCategoryCollectionViewCell
//      previousCell.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    }
    
//    let currentCell = collectionView.cellForItem(at: indexPath) as! MainCategoryCollectionViewCell
//    currentCell.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//

    
//    if let didSelectedCheckIndex = collectionView.cellForItem(at: indexPath) as? MainCategoryCollectionViewCell {
//    didSelectedCheckIndex.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//    }
  
    
//    if indexPath.row == 0  {
//      didSelectedCheckIndex?.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
//      didSelectedCheckIndex?.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//    } else {
//      didSelectedCheckIndex?.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    }
//
//    if indexPath.row == 1 {
//      didSelectedCheckIndex?.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
//           didSelectedCheckIndex?.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//    } else {
//      didSelectedCheckIndex?.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    }
//
//    if indexPath.row == 2 {
//      didSelectedCheckIndex?.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
//                didSelectedCheckIndex?.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
//    } else {
//      didSelectedCheckIndex?.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
//    }
//    collectionView.reloadData()
    
    
    if let didSelectCheckIndex = collectionView.cellForItem(at: indexPath) as? MainCategoryCollectionViewCell {
      UIView.animate(withDuration: 0.5) {
        didSelectCheckIndex.menuName.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
        didSelectCheckIndex.menuName.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        didSelectCheckIndex.nameSubLine.isHidden = false
      }
      delegate?.changeView(index: indexPath.row)
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    if let didDeslectCheckIndex = collectionView.cellForItem(at: indexPath) as? MainCategoryCollectionViewCell {
      UIView.animate(withDuration: 0.5) {
        didDeslectCheckIndex.menuName.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
        didDeslectCheckIndex.menuName.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        didDeslectCheckIndex.nameSubLine.isHidden = true
      }
    }
  }
}
