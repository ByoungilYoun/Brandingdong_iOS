//
//  HomeViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  // MARK: - Property
  
  private let productSearchView = ProductSearchView()
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    hiddenNavi()
    
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    
    productSearchView.backgroundColor = .systemIndigo
    
    [productSearchView].forEach {
      view.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let margin: CGFloat = 10
    let productSearchViewHeight: CGFloat = 50
    
    [productSearchView].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(margin)
        $0.trailing.equalToSuperview().offset(-margin)
      }
    }
    
    productSearchView.snp.makeConstraints {
      $0.top.equalToSuperview().offset(margin)
      $0.height.equalTo(productSearchViewHeight)
    }
  }
  
  // MARK: - Navigation Hidden
  
  private func hiddenNavi() {
    navigationController?.navigationBar.isHidden = true
  }
}
