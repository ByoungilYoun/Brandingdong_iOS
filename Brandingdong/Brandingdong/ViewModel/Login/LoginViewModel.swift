//
//  LoginViewModel.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/08/25.
//  Copyright © 2020 jwlee. All rights reserved.
//

import Foundation

protocol AuthenticationProtocol {
  var IdIsValid : Bool {get}
  var PasswordIsValid : Bool {get}
}

struct LoginViewModel : AuthenticationProtocol {
  var id : String?
  var password : String?
  
  var IdIsValid: Bool {
    return id?.isEmpty == false
  }
  
  var PasswordIsValid: Bool {
    return password?.isEmpty == false
  }
  
  var xmarkOnId : Bool {
    return id?.isEmpty == false
  }
  
  var xmarkOnPassword : Bool {
    return password?.isEmpty == false 
  }
  
  
}

