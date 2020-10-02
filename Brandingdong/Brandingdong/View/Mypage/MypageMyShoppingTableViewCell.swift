//
//  MypageMyShoppingTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/30.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

protocol MypageMyShoppingTableViewCellDelegate {
  func naviPushVC()
}

class MypageMyShoppingTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "MypageMyShoppingTableViewCell"
  
  private let deviceWidth = UIScreen.main.bounds.width
  private let deviceHeight = UIScreen.main.bounds.height
  
  private let categoryImageArr = ["마이페이지장바구니",
                                  "마이페이지친구초대",
                                  "마이페이지Q&A",
                                  "마이페이지리뷰",
                                  "마이페이지고객센터",
                                  "마이페이지FAQ"].compactMap {
                                    UIImage.init(named: $0)
                                  }
  
  private let categoryTitleArr = ["장바구니",
                                  "친구초대",
                                  "Q&A",
                                  "MY리뷰",
                                  "고객센터",
                                  "FAQ"]
  
  private let titleLabel: UILabel = {
    let lb = UILabel()
    lb.text = "MY쇼핑"
    lb.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 18)
    return lb
  }()
  
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  var delegate: MypageMyShoppingTableViewCellDelegate?
  
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
    
    let titleLabelHeight: CGFloat = 52
    let padding: CGFloat = 8
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
      $0.leading.equalToSuperview().offset(padding)
      $0.height.equalTo(titleLabelHeight)
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(padding)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Set Property
  
  private func setLayout() {
    
    let itemSpacing: CGFloat = 0
    let lineSpacing: CGFloat = 0
    let sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    let itemWidth: CGFloat = deviceWidth / 2
    let itemHeight: CGFloat = ((deviceHeight / 3) - 68) / 3
    
    layout.scrollDirection = .vertical
    layout.sectionInset = sectionInset
    layout.minimumLineSpacing = lineSpacing
    layout.minimumInteritemSpacing = itemSpacing
    layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
  }
  
  private func setCollectionView() {
    collectionView.backgroundColor = .systemBackground
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(MypageMyShoppingCollectionViewCell.self,
                            forCellWithReuseIdentifier: MypageMyShoppingCollectionViewCell.identifier)
  }
}

// MARK: - UICollectionViewDataSource

extension MypageMyShoppingTableViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return categoryTitleArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MypageMyShoppingCollectionViewCell.identifier,
                                                  for: indexPath) as! MypageMyShoppingCollectionViewCell
    cell.layer.borderWidth = 1
    cell.layer.borderColor = UIColor.lightGray.cgColor
    
    cell.configure(image: categoryImageArr[indexPath.item],
                   title: categoryTitleArr[indexPath.item])
    return cell
  }
}

// MARK: - UICollectionViewDelegate

extension MypageMyShoppingTableViewCell: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let didTapIndexPath = collectionView.cellForItem(at: indexPath) as? MypageMyShoppingCollectionViewCell {
      switch didTapIndexPath.titleLabel.text {
      case "장바구니":
        delegate?.naviPushVC()
      default:
        break
      }
    }
  }
}
