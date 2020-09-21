//
//  Data.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

struct CategoryData {
  static let categoryMenuName = [
    "쇼핑몰*마켓",
    "브랜드",
    "뷰티"]
}

struct HomeInfoCodAble {
  
  struct Events : Codable {
    var images : String
  }
  
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
      var intro: String
    }
  }
}

struct HomeInfoDatas {
  
  static var names: [String] = []
  static var price: [Int]  = []
  static var images: [String]  = []
  static var brandNames: [String]  = []
  static var bannerImages: [String]  = []
  static var productNameAndBrandImageIntro: [String:[String:String]] = [:]
  static var productNameAndImages: [String:[Int:String]] = [:]
  static var productNameAndBrandNamePrice: [String:[String:Int]] = [:]
}

struct ProductInfo {
  static var checkProductNameImageArr: [UIImage] = []
  static var checkProductBrandName: String = ""
  static var checkProductName: String = ""
  static var checkProductPrice: String = ""
  static var checkProductBrandImage: String = ""
  static var checkProductBrandIntro: String = ""
}
