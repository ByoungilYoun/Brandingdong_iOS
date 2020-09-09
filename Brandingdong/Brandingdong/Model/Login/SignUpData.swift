//
//  SignUpData.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/09.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

struct SignUpData: Codable {
  var username: String
  var email: String
  var password1: String
  var password2: String
  var phonenumber: String
    
  init (dic: [String:Any]) {
        
    self.username = dic["username"] as? String ?? ""
    self.email = dic["email"] as? String ?? ""
    self.password1 = dic["password1"] as? String ?? ""
    self.password2 = dic["password2"] as? String ?? ""
    self.phonenumber = dic["phonenumber"] as? String ?? ""
  }
}
