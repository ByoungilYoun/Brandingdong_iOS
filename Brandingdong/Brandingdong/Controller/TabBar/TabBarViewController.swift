//
//  TabBarViewController.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
  // MARK: - Property
  
  private let naviHomeVC = UINavigationController(rootViewController: HomeViewController())
  private let naviCategoryVC = UINavigationController(rootViewController: CategoryViewController())
  private let naviFavoriteVC = UINavigationController(rootViewController: FavoriteViewController())
  private let naviMyPageVC = UINavigationController(rootViewController: MYPageViewController())
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setTabBar()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  // MARK: - SetTabBar
  
  private func setTabBar() {
    view.backgroundColor = .systemBackground
    naviHomeVC.tabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house"), tag: 0)
    naviCategoryVC.tabBarItem = UITabBarItem(title: "카테고리", image: UIImage(systemName: "square.grid.2x2"), tag: 1)
    naviFavoriteVC.tabBarItem = UITabBarItem(title: "찜", image: UIImage(systemName: "heart"), tag: 2)
    naviMyPageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(systemName: "person"), tag: 3)

    viewControllers = [naviHomeVC, naviCategoryVC, naviFavoriteVC, naviMyPageVC]
  }
  private func setNavi() {
    navigationController?.navigationBar.isHidden = true
  }
}
