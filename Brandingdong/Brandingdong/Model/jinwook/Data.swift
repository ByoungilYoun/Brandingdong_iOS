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

struct HomeInfoDatas {
  
  static var names: [String] = []
  static var price: [Int]  = []
  static var images: [String]  = []
  static var brandNames: [String]  = []
  static var bannerImages: [String]  = []
  static var productNameAndBrandImage: [String:String] = [:]
  static var productNameAndImages: [String:[Int:String]] = [:]
  static var productNameAndBrandNamePrice: [String:[String:Int]] = [:]
}

struct ProductInfo {
  static var checkProductNameImageArr: [UIImage] = []
  static var checkProductBrandName: String = ""
  static var checkProductName: String = ""
  static var checkProductPrice: String = ""
  static var checkProductBrandImage: String = ""
}
