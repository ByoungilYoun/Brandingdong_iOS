//
//  CommonAlert.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/16.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

func createAlert(title: String?, message: String?, actions: [UIAlertAction]) {
  let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
  for action in actions {
    alert.addAction(action)
  }
  present(alert, animated: true)
}

