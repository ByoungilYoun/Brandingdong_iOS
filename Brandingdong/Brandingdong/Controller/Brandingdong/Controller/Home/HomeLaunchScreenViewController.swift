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
  
  // MARK: - Json Codable
  
  struct ProductList: Codable {
    var results: [Results]
    
    struct Results: Codable {
      var id: Int
      var name: String
      var price: Int
      var main_img: [Images]
      var brand: Brand
    }
    
    struct Images : Codable {
      var image : String
    }
    
    struct Brand: Codable {
      var name: String
      var brand_img: String
    }
  }
  
  struct Events : Codable {
    var images : String
  }
  
  
  // MARK: - LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    setIndicatorView()
    getProductList()
    getBannerImages()
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
  
  func getProductList() {
    let productUrl = "http://52.78.75.94/products/detail"
    
    AF.request(productUrl, method: .get).responseJSON { response in
      guard let jsonData = response.data else { return }
      do {
        let productDatas = try JSONDecoder().decode(ProductList.self, from: jsonData)
        
        for index in 0..<productDatas.results.count {
          
          let name = productDatas.results[index].name
          let price = productDatas.results[index].price
          let mainImages = productDatas.results[index].main_img[0].image
          let brandName = productDatas.results[index].brand.name
          let brandImages = productDatas.results[index].brand.brand_img
          
          HomeInfoDatas.names.append(name)
          HomeInfoDatas.price.append(price)
          HomeInfoDatas.images.append(mainImages)
          HomeInfoDatas.brandNames.append(brandName)
          
          if !(HomeInfoDatas.productNameAndBrandNamePrice.keys.contains(name)) {
            HomeInfoDatas.productNameAndBrandImage[name] = brandImages
          } else {
            HomeInfoDatas.productNameAndBrandImage.updateValue(brandImages, forKey: name)
          }
          
          if !(HomeInfoDatas.productNameAndBrandNamePrice.keys.contains(name)) {
            HomeInfoDatas.productNameAndBrandNamePrice[name] = [brandName : price]
          } else {
            HomeInfoDatas.productNameAndBrandNamePrice[name]?.updateValue(price, forKey: brandName)
          }
          
          for imageIndex in 0..<productDatas.results[index].main_img.count {
            if !(HomeInfoDatas.productNameAndImages.keys.contains(name)) {
              HomeInfoDatas.productNameAndImages[name] = [imageIndex : productDatas.results[index].main_img[imageIndex].image]
            } else {
              HomeInfoDatas.productNameAndImages[name]?.updateValue(productDatas.results[index].main_img[imageIndex].image, forKey: imageIndex)
            }
          }
          self.firstToggle = true
          
        }
      } catch {
        print ("failed to convert error : ", error.localizedDescription)
      }
    }
  }
  
  private func getBannerImages() {
    let bannerUrl = "http://52.78.75.94/events/"
    AF.request(bannerUrl, method: .get).responseJSON { response in
      guard let jsonData = response.data else { return }
      do {
        let bannerImages = try JSONDecoder().decode([Events].self, from: jsonData)
        for index in 0..<bannerImages.count {
          HomeInfoDatas.bannerImages.append(bannerImages[index].images)
          self.secondToggle = true
        }
      } catch {
        print ("error : ", error.localizedDescription)
      }
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

// MARK: - Test Code

/*
 private func getProductListUrlSession() {
 
 let productUrl = "http://52.78.75.94/products/detail"
 guard let url = URL(string: productUrl) else { return }
 let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
 guard error == nil else { return print ("error : ", error!.localizedDescription)}
 let responsea = response as? HTTPURLResponse
 print (responsea!.statusCode)
 guard let response = response as? HTTPURLResponse,
 (200..<406).contains(response.statusCode) else { return }
 guard let data = data else { return }
 do {
 let userResult = try JSONDecoder().decode(ProductList.self, from: data)
 
 for index in 0..<userResult.results.count {
 HomeInfoDatas.names.append(userResult.results[index].name)
 HomeInfoDatas.price.append(userResult.results[index].price)
 HomeInfoDatas.images.append(userResult.results[index].main_img[0].image)
 HomeInfoDatas.brandNames.append(userResult.results[index].brand.name)
 
 for imageIndex in 0..<userResult.results[index].main_img.count {
 if !(HomeInfoDatas.idAndImages.keys.contains(userResult.results[index].name)) {
 HomeInfoDatas.idAndImages[userResult.results[index].name] = [imageIndex : userResult.results[index].main_img[imageIndex].image]
 } else {
 HomeInfoDatas.idAndImages[userResult.results[index].name]?.updateValue(userResult.results[index].main_img[imageIndex].image, forKey: imageIndex)
 }
 }
 self.firstToggle = true
 }
 } catch {
 print ("failed to convert error : ", error.localizedDescription)
 }
 }
 task.resume()
 }
 
 private func getProductDetailImage() {
 let productUrl = "http://52.78.75.94/events/"
 guard let url = URL(string: productUrl) else { return }
 let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
 guard error == nil else { return print ("error : ", error!.localizedDescription)}
 let responsea = response as? HTTPURLResponse
 print (responsea!.statusCode)
 guard let response = response as? HTTPURLResponse,
 (200..<406).contains(response.statusCode) else { return }
 guard let data = data else { return }
 do {
 let detailImages = try JSONDecoder().decode([Events].self, from: data)
 for index in 0..<detailImages.count {
 HomeInfoDatas.bannerImages.append(detailImages[index].images)
 self.secondToggle = true
 }
 } catch {
 print ("failed to convert error : ", error.localizedDescription)
 }
 }
 task.resume()
 }
 
 */
