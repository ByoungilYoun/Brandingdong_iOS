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
  
  struct ProductList: Codable {
    var next: String
    var results: [Results]
    
    struct Results: Codable {
      var name: String
      var price: Int
      var discount_rate: String
      var sales_count: Int
    }
  }
  
  struct Events: Codable {
    var images: String
  }
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    getImages()
//    getProductList()
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
  
  private func getProductList() {
    print ("서비스")
    let productUrl = "http://52.78.75.94/products/detail"
    guard let url = URL(string: productUrl) else { return }
    print ("서비스1")
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else { return print ("error : ", error!.localizedDescription)}
      print ("서비스2")
      let responsea = response as? HTTPURLResponse
      print (responsea!.statusCode)
      guard let response = response as? HTTPURLResponse,
        (200..<406).contains(response.statusCode) else { return }
      print ("서비스3")
      guard let data = data else { return }
      print ("서비스4")
      print (data)
      do {
        let userResult = try JSONDecoder().decode(ProductList.self, from: data)
        for index in 0..<userResult.results.count {
//          print (userResult.next)
//          print (userResult.results[index].name)
//          print (userResult.results[index].price)
//          print (userResult.results[index].discount_rate)
//          print (userResult.results[index].sales_count)
        }
        print ("서비스4")
      } catch {
        print ("failed to convert error : ", error.localizedDescription)
      }
    }
    task.resume()
  }
  
  private func getImages() {
    print ("서비스")
    let productUrl = "http://52.78.75.94/events/"
    guard let url = URL(string: productUrl) else { return }
    print ("서비스1")
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      guard error == nil else { return print ("error : ", error!.localizedDescription)}
      print ("서비스2")
      let responsea = response as? HTTPURLResponse
      print (responsea!.statusCode)
      guard let response = response as? HTTPURLResponse,
        (200..<406).contains(response.statusCode) else { return }
      print ("서비스3")
      guard let data = data else { return }
      print ("서비스4")
      print (data)
      do {
        let bannerImages = try JSONDecoder().decode([Events].self, from: data)
        for index in 0..<bannerImages.count {
          print (bannerImages[index])
        }
        print ("서비스4")
      } catch {
        print ("failed to convert error : ", error.localizedDescription)
      }
    }
    task.resume()
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
