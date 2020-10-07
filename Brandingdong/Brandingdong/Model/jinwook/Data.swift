//
//  Data.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

// MARK: - Json Codable

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

struct ProductInfoCodAble: Codable {
  
  struct ProductDetail: Codable {
    var product: Int
    var info_img: [Images]
  }
  
  struct Images: Codable {
    var image: String
  }
}

struct ProductOptinCodAble {
  
  struct ProductOption: Codable {
    let color: String
    let size: String
  }
}

// MARK: - Struct

struct Device {
  static let width = UIScreen.main.bounds.width
  static let height = UIScreen.main.bounds.height
}

struct HomeInfoDatas {
  
  static var names: [String] = []
  static var price: [Int]  = []
  static var images: [String]  = []
  static var brandNames: [String]  = []
  static var bannerImages: [String]  = []
  static var productIdAndName: [Int:String] = [:]
  static var productNameAndBrandImageIntro: [String:[String:String]] = [:]
  static var productNameAndImages: [String:[Int:String]] = [:]
  static var productNameAndBrandNamePrice: [String:[String:Int]] = [:]
}

struct ProductInfoCategoryDatas {
  static var idAndInfoImages: [Int:[Int:String]] = [:]
}

struct ProductInfo {
  static var checkProductNameImageArr: [UIImage] = []
  static var checkProductDetailImageArr: [UIImage] = []
  static var checkProductId: Int = 0
  static var checkProductBrandName: String = ""
  static var checkProductName: String = ""
  static var checkProductPrice: Int = 0
  static var checkProductBrandImage: String = ""
  static var checkProductBrandIntro: String = ""
}

struct Favorite {
  static var checkFavoriteProductList: [Int] = []
  static var checkRecentProductList: [String] = []
}

struct Mypage {
  static let myPageTopViewImageArr = ["포인트", "쿠폰", "주문_배송조회"]
    .map {UIImage.init(named: $0)}
}

struct Imsi {
  static let contentsArr = ["상품 배송, 포인트 지급, Q&A 등 중요한 알림을 받아 볼 수 있습니다.\n 자세한 정보는 상단 MY 쇼핑에서 확인할 수 있습니다.",
                             "브랜디에 회원가입을 해주셔서 감사합니다.\n프로필을 설정하고 맞춤 정보를 받아보세요."]
  
}

struct ProductOption {
  static var size: [String] = []
  static var color: [String] = []
  
  static var selectedChoice = [String]()
}

struct ShoppingBasket {
  static var addBasketProduct: [String] = []
}
