//
//  HomeViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
  // MARK: - Property
  
  private let searchBasketView = SearchBasketView()
  private let mainCategoryView = MainCategoryView()
  private let shoppingMallVC = ShoppingMallViewController()
  private let brandVC = BrandViewController()
  private let beautyVC = BeautyViewController()
  
  private let moveToTopButton : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(systemName: "arrow.up"), for: .normal)
    bt.tintColor = .black
    bt.backgroundColor = UIColor.lightGray.withAlphaComponent(0.4)
    bt.layer.borderWidth = 1
    bt.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
    bt.addTarget(self, action: #selector(moveToTop(view:)), for: .touchUpInside)
    return bt
  }()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    mainCategoryView.delegate = self
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    hiddenNavi()
    shoppingMallVC.view.isHidden = false
    
  }
  
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    resizeButton()
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    
    [searchBasketView, mainCategoryView, shoppingMallVC.view, brandVC.view, beautyVC.view, moveToTopButton].forEach {
      view.addSubview($0)
    }
    
    shoppingMallVC.view.isHidden = false
    shoppingMallVC.didMove(toParent: self)
    
    brandVC.view.isHidden = true
    brandVC.didMove(toParent: self)
    
    beautyVC.view.isHidden = true
    beautyVC.didMove(toParent: self)
  }
  
  private func setConstraints() {
    
    let margin: CGFloat = 10
    let viewHeight: CGFloat = 50
    
    [searchBasketView, mainCategoryView].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(margin)
        $0.height.equalTo(viewHeight)
      }
    }
    
    searchBasketView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(margin)
      $0.trailing.equalToSuperview().offset(-margin)
    }
    
    mainCategoryView.snp.makeConstraints {
      $0.top.equalTo(searchBasketView.snp.bottom).offset(margin)
      $0.trailing.equalToSuperview()
    }
    shoppingMallVC.view.snp.makeConstraints {
      $0.top.equalTo(mainCategoryView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    brandVC.view.snp.makeConstraints {
      $0.top.equalTo(mainCategoryView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    beautyVC.view.snp.makeConstraints {
      $0.top.equalTo(mainCategoryView.snp.bottom)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    
    moveToTopButton.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-16)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
      $0.width.height.equalTo(50)
    }
  }
  
  private func resizeButton() {
    moveToTopButton.layer.cornerRadius = moveToTopButton.frame.width / 2
    moveToTopButton.clipsToBounds = true
  }
  
  // MARK: - Navigation Hidden
  
  private func hiddenNavi() {
    navigationController?.navigationBar.isHidden = true
  }
  
  @objc func moveToTop(view : UIViewController ){
    
  }
}

extension HomeViewController : ChangeViewDelegate {
  func changeView(index: Int) {
    if index == 0 {
      shoppingMallVC.view.isHidden = false
      brandVC.view.isHidden = true
      beautyVC.view.isHidden = true
    } else if index == 1 {
      brandVC.view.isHidden = false
      shoppingMallVC.view.isHidden = true
      beautyVC.view.isHidden = true
    } else {
      beautyVC.view.isHidden = false
      shoppingMallVC.view.isHidden = true
      brandVC.view.isHidden = true
    }
  }
}
