//
//  OuterViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/07.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class OuterViewController : UIViewController {
  
  //MARK: - Properties
  private let firstCategoryView = FirstCategoryView()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setNavi()
    setUI()
    setConstraints()
  }
  
  //MARK: - setNavi()
  private func setNavi() {
    title = "쇼핑몰 마켓"
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(moveBack))
    navigationItem.leftBarButtonItem?.tintColor = .black
    
    let glassButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"), style: .plain, target: self, action: #selector(searchButtonClicked))
    glassButton.tintColor = .black
    let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartButtonClicked))
    cartButton.tintColor = .black
    navigationItem.rightBarButtonItems = [cartButton, glassButton]
  }
  
  //MARK: - setUI()
  private func setUI() {
    firstCategoryView.backgroundColor = .systemBackground
    view.addSubview(firstCategoryView)
  }
  
  private func setConstraints() {
    firstCategoryView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.leading.equalToSuperview().offset(10)
      $0.trailing.equalToSuperview()
      $0.height.equalTo(50)
    }
  }
  
  //MARK: - objc func
  @objc func moveBack() {
    navigationController?.popViewController(animated: true)
  }
  
  @objc func searchButtonClicked() {
    
  }
  
  @objc func cartButtonClicked() {
    
  }
  
}



