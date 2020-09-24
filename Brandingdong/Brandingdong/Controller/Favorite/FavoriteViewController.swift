//
//  FavoriteViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {
  // MARK: - Property
  
  private let buttonView: UIView = {
    let view = UIView()
    view.layer.borderWidth = 2
    view.layer.borderColor = UIColor.lightGray.cgColor
    return view
  }()
  
  private let favoriteProductButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("찜한 상품", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
    btn.addTarget(self, action: #selector(didTapCategoryButton), for: .touchUpInside)
    return btn
  }()
  
  private let recentProductButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("최근 본 상품", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    btn.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
    btn.addTarget(self, action: #selector(didTapCategoryButton), for: .touchUpInside)
    return btn
  }()
  
  private let buttonSubLineView: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    return view
  }()
  
  private let deviceWidth = UIScreen.main.bounds.width
  
  private let layout = UICollectionViewFlowLayout()
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  
  private let favoriteProductCollectionViewCell = FavoriteProductCollectionViewCell()
  private let recentProductCollectionViewCell = RecentProductCollectionViewCell()
  
  lazy var collectionViewCellArr = [favoriteProductCollectionViewCell,
                                    recentProductCollectionViewCell]
  
  private let pageControl = UIPageControl()
  private var collectionPage = 0 {
    didSet {
      buttonStateChange(button: nil, page: collectionPage)
    }
  }
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    setLayout()
    setCollectionView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [buttonView,
     collectionView].forEach {
      view.addSubview($0)
     }
    
    [favoriteProductButton,
     recentProductButton,
     buttonSubLineView].forEach {
      buttonView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    let buttonViewHeight: CGFloat = 52
    
    buttonView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(buttonViewHeight)
    }
    
    [favoriteProductButton,
     recentProductButton].forEach {
      $0.snp.makeConstraints {
        $0.top.bottom.equalToSuperview()
        $0.centerY.equalToSuperview()
      }
     }
    
    favoriteProductButton.snp.makeConstraints {
      $0.leading.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.5)
    }
    
    recentProductButton.snp.makeConstraints {
      $0.trailing.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.5)
    }
    
    buttonSubLineView.snp.makeConstraints {
      $0.leading.equalTo(0)
      $0.width.equalTo(favoriteProductButton.snp.width)
      $0.bottom.equalTo(buttonView.snp.bottom)
      $0.height.equalTo(5)
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(buttonView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
  
  // MARK: - Set Property
  
  private func setLayout() {
    
    let itemHeight: CGFloat = 632
    let itemSpasing: CGFloat = 0
    let lineSpasing: CGFloat = 0
    let sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    layout.scrollDirection = .horizontal
    layout.sectionInset = sectionInset
    layout.minimumLineSpacing = lineSpasing
    layout.minimumInteritemSpacing = itemSpasing
    layout.itemSize = CGSize(width: deviceWidth, height: itemHeight)
  }
  
  private func setCollectionView() {
    collectionView.backgroundColor = .systemBackground
    collectionView.isPagingEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.dataSource = self
    collectionView.delegate = self
    
    collectionView.register(FavoriteProductCollectionViewCell.self,
                            forCellWithReuseIdentifier: FavoriteProductCollectionViewCell.identifer)
    
    collectionView.register(RecentProductCollectionViewCell.self,
                            forCellWithReuseIdentifier: RecentProductCollectionViewCell.identifer)
  }
  
  // MARK: - NavigationBar
  
  private func setNavi() {
    
    navigationController?.navigationBar.isHidden = false
    navigationItem.title = "찜"
    
    let rightBasketButton = UIBarButtonItem(
      image: UIImage(systemName: "cart"),
      style: .plain,
      target: self,
      action: #selector(didTapBasketButton))
    
    rightBasketButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    
    navigationItem.rightBarButtonItem = rightBasketButton
    navigationController?.navigationBar.barTintColor = .white
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for:.default)
    navigationController?.navigationBar.layoutIfNeeded()
  }
  
  // MARK: - Button State Change
  
  private func buttonStateChange(button: UIButton?, page: Int?) {
    if button == favoriteProductButton || page == 0 {
      UIView.animate(withDuration: 0.2) { [self] in
        favoriteProductButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        favoriteProductButton.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        recentProductButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        recentProductButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        buttonSubLineView.snp.updateConstraints {
          $0.leading.equalTo(0)
        }
        view.layoutIfNeeded()
      }
      collectionView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
      
    } else if button == recentProductButton || page == 1 {
      UIView.animate(withDuration: 0.2) { [self] in
        recentProductButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 18)
        recentProductButton.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        favoriteProductButton.titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 18)
        favoriteProductButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        buttonSubLineView.snp.updateConstraints {
          $0.leading.equalToSuperview().offset(self.deviceWidth / 2)
        }
        view.layoutIfNeeded()
      }
      collectionView.setContentOffset(CGPoint(x: deviceWidth, y: 0), animated: true)
    }
  }
  
  @objc private func didTapBasketButton(_ sender: UIBarButtonItem) {
    
  }
  
  @objc private func didTapCategoryButton(_ sender: UIButton) {
    buttonStateChange(button: sender, page: nil)
  }
}

// MARK: - UICollectionViewDataSource
extension FavoriteViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return collectionViewCellArr.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    switch indexPath.item {
    case 0:
      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: FavoriteProductCollectionViewCell.identifer,
        for: indexPath) as! FavoriteProductCollectionViewCell
      return cell
    case 1:
      let cell = collectionView.dequeueReusableCell(
        withReuseIdentifier: RecentProductCollectionViewCell.identifer,
        for: indexPath) as! RecentProductCollectionViewCell
      return cell
    default:
      break
    }
    return UICollectionViewCell()
  }
}

// MARK: - UICollectionViewDelegate
extension FavoriteViewController: UICollectionViewDelegate {
  func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    
    let page = Int(targetContentOffset.pointee.x / deviceWidth)
    pageControl.currentPage = page
    collectionPage = page
  }
}
