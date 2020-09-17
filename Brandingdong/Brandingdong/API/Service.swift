//
//  Service.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/09.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

struct Service {
  
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
