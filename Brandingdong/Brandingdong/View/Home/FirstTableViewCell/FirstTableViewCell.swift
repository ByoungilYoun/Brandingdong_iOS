//
//  FirstTableViewCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/15.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FirstTableViewCell : UITableViewCell {
  
  //MARK: - Properties
  
  static let identifier = "FirstTableViewCell"
  
  private let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  private let pageControl = UIPageControl()
  private var bannerImage: [UIImage] = [] {
    didSet {
      collectionView.reloadData()
    }
  }
  
  //MARK: - init
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setUI()
    setConstraints()
    setCollectionView()
    setPageControl()
    setBannerImages()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  
  private func setUI() {
    [collectionView,
     pageControl].forEach {
      contentView.addSubview($0)
    }
  }
  
  //MARK: - setConstraints()
  
  private func setConstraints() {
    collectionView.snp.makeConstraints {
      $0.top.leading.trailing.bottom.equalTo(contentView)
    }
    
    pageControl.snp.makeConstraints {
      $0.centerX.equalTo(contentView)
      $0.bottom.equalTo(contentView).offset(-20)
    }
  }
  
  //MARK: - setCollectionView()
  
  private func setCollectionView() {
    collectionView.backgroundColor = .systemBackground
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.isPagingEnabled = true
    collectionView.register(
      FirstCollectionViewCell.self,
      forCellWithReuseIdentifier: FirstCollectionViewCell.identifier)
  }
  
  //MARK: - setPageControl()
  
  private func setPageControl() {
    pageControl.numberOfPages = bannerImage.count
    pageControl.pageIndicatorTintColor = .lightGray
    pageControl.currentPageIndicatorTintColor = .white
    pageControl.addTarget(self, action: #selector(pageControlDidChange), for: .valueChanged)
  }
  
  private func setBannerImages() {
    for index in 0..<HomeInfoDatas.bannerImages.count {
      let url = URL(string: HomeInfoDatas.bannerImages[index])
      let data = try! Data(contentsOf: url!)
      bannerImage.append(UIImage(data: data)!)
    }
  }
  
  //MARK: - @objc func
  @objc private func pageControlDidChange(_ sender : UIPageControl) {
    let current = sender.currentPage
    collectionView.setContentOffset(CGPoint(x: CGFloat(current) * self.frame.size.width ,
                                            y: 0), animated: true)
  }
}
//MARK: - UICollectionViewDataSource
extension FirstTableViewCell : UICollectionViewDataSource {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return bannerImage.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstCollectionViewCell.identifier, for: indexPath) as! FirstCollectionViewCell
    cell.configure(bannerImage: bannerImage[indexPath.item])
    return cell
  }
}

//MARK: - UICollectionViewDelegate

extension FirstTableViewCell : UICollectionViewDelegate {
  
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    let page = Int(targetContentOffset.pointee.x / self.frame.width)
    pageControl.currentPage = page
  }
}

//MARK: - UIColectionViewDelegateFlowLayout
extension FirstTableViewCell : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = self.frame.size.width
    let height = self.frame.size.height
    return CGSize(width: width, height: height)
  }
}
