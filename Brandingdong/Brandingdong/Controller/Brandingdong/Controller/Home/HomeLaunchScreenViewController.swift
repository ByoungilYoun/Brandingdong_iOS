//
//  HomeLaunchScreenViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/17.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import Alamofire

class HomeLaunchScreenViewController: UIViewController {
  
  // MARK: - Property
  
  private let imageView = UIImageView()
  private let indicatorView = UIActivityIndicatorView()
  
  var firstToggle = false {
    didSet {
      networkCheck(firstToggle: firstToggle, secondToggle: secondToggle)
    }
  }
  var secondToggle = false {
    didSet {
      networkCheck(firstToggle: firstToggle, secondToggle: secondToggle)
    }
  }
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    setIndicatorView()
    HomeInfoGetData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    imageView.image = UIImage(named: "brandi")
    [imageView,
     indicatorView].forEach {
      view.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    indicatorView.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
    }
  }
  
  private func setNavi() {
    navigationController?.navigationBar.isHidden = true
  }
  
  private func setIndicatorView() {
    indicatorView.style = .large
    indicatorView.hidesWhenStopped = true
    indicatorView.color = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    indicatorView.startAnimating()
  }
  
  private func HomeInfoGetData() {
    
    Service.getProductList { (isSuccess) in
      guard isSuccess else { return }
      self.firstToggle = true
    }
    
    Service.getBannerImages { (isSuccess) in
      guard isSuccess else { return }
      self.secondToggle = true
    }
    
    Service.getProductInfoDetail { (isSucess) in
      guard isSucess else { return }
    }
  }
  
  private func networkCheck(firstToggle: Bool, secondToggle: Bool) {
    guard firstToggle else { return }
    guard secondToggle else { return }
    DispatchQueue.main.async {
      let tabBarVC = TabBarViewController()
      tabBarVC.view.backgroundColor = .white
      self.navigationController?.pushViewController(tabBarVC, animated: true)
    }
    self.firstToggle = false
    self.secondToggle = false
  }
}

