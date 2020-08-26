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
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    hiddenNavi()
    
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    
    [searchBasketView, mainCategoryView].forEach {
      view.addSubview($0)
    }
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
  }
  
  // MARK: - Navigation Hidden
  
  private func hiddenNavi() {
    navigationController?.navigationBar.isHidden = true
  }
}
