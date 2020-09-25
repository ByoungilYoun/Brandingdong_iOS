//
//  Service.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/09.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import Alamofire

struct Service {
  
  static func getProductInfoDetail(completion: @escaping (Bool) -> Void) {
    let productDetailUrl = "http://52.78.75.94/products/info"
    
    AF.request(productDetailUrl, method: .get).responseJSON { response in
      guard let jsonData = response.data else { return }
      do {
        let productDetailDatas = try JSONDecoder().decode([ProductInfoCodAble.ProductDetail].self, from: jsonData)
        
        for index in 0..<productDetailDatas.count {
          let id = productDetailDatas[index].product
          
          for indexImage in 0..<productDetailDatas[index].info_img.count {
            let image = productDetailDatas[index].info_img[indexImage].image
            
            if !(ProductInfoCategoryDatas.idAndInfoImages.keys.contains(id)) {
              ProductInfoCategoryDatas.idAndInfoImages[id] = [indexImage:image]
            } else {
              ProductInfoCategoryDatas.idAndInfoImages[id]?.updateValue(image, forKey: indexImage)
            }
          }
        }
        completion(true)
      } catch {
        print ("error : ", error.localizedDescription)
      }
    }
  }
  
  static func getBannerImages(completion: @escaping (Bool) -> Void ) {
    
    let bannerUrl = "http://52.78.75.94/events/"
    AF.request(bannerUrl, method: .get).responseJSON { response in
      guard let jsonData = response.data else { return }
      do {
        let bannerImages = try JSONDecoder().decode([HomeInfoCodAble.Events].self, from: jsonData)
        for index in 0..<bannerImages.count {
          HomeInfoDatas.bannerImages.append(bannerImages[index].images)
        }
        DispatchQueue.main.async {
          completion(true)
        }
      } catch {
        print ("error : ", error.localizedDescription)
      }
    }
  }
  
  static func getProductList(completion: @escaping (Bool) -> Void) {
    let productUrl = "http://52.78.75.94/products/detail"
    
    AF.request(productUrl, method: .get).responseJSON { response in
      guard let jsonData = response.data else { return }
      do {
        let productDatas = try JSONDecoder().decode(HomeInfoCodAble.ProductList.self, from: jsonData)
        
        for index in 0..<productDatas.results.count {
          
          let id = productDatas.results[index].id
          let name = productDatas.results[index].name
          let price = productDatas.results[index].price
          let mainImages = productDatas.results[index].main_img[0].image
          let brandName = productDatas.results[index].brand.name
          let brandImages = productDatas.results[index].brand.brand_img
          let brandIntro = productDatas.results[index].brand.intro
          
          HomeInfoDatas.names.append(name)
          HomeInfoDatas.price.append(price)
          HomeInfoDatas.images.append(mainImages)
          HomeInfoDatas.brandNames.append(brandName)
          
          HomeInfoDatas.productIdAndName[id] = name
          
          if !(HomeInfoDatas.productNameAndBrandImageIntro.keys.contains(name)) {
            HomeInfoDatas.productNameAndBrandImageIntro[name] = [brandIntro : brandImages]
          } else {
            HomeInfoDatas.productNameAndBrandImageIntro[name]?.updateValue(brandImages, forKey: brandIntro)
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
          DispatchQueue.main.async {
            completion(true)
          }
        }
      } catch {
        print ("failed to convert error : ", error.localizedDescription)
      }
    }
  }
  
  static func signUpUser(username: String, email: String, password1: String, password2: String, phonenumber: String) {
    let signUpUrl = "http://52.78.75.94/auth/signup/"
    guard let url = URL(string: signUpUrl) else  { return print ("can't not create url")}
    
    let userData: [String:Any] = ["username": username,
                                  "email": email,
                                  "password1" : password1,
                                  "password2" : password2,
                                  "phonenumber" : phonenumber]
    
    guard let userJsonData = try? JSONSerialization.data(withJSONObject: userData) else { return print ("JSONSerialization error")}
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = userJsonData
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard error == nil else { return print("error : ", error!.localizedDescription)}
      guard let response = response as? HTTPURLResponse else { return print("response error")}
      
      guard let data = data,
            let signedUpUser = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else { return }
      
      print (signedUpUser)
      print (response.statusCode)
    }
    task.resume()
  }
  
  static func signInUser(username: String, password: String) {
    let loginUrl = "http://52.78.75.94/auth/login/"
    guard let url = URL(string: loginUrl) else { return print ("can't not create url")}
    
    let loginData: [String:Any] = ["username" : username,
                                   "password":password]
    
    guard let loginJsonData = try? JSONSerialization.data(withJSONObject: loginData) else { return print ("JSONSerialization error")}
    
    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "POST"
    urlRequest.httpBody = loginJsonData
    urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
      guard error == nil else { return print("error : ", error!.localizedDescription)}
      guard let response = response as? HTTPURLResponse else { return print("response error")}
      
      guard let data = data,
            let loginUser = try? JSONSerialization.jsonObject(with: data) as? [String : Any] else { return }
      
      print (loginUser)
      print (response.statusCode)
    }
    task.resume()
  }
}
