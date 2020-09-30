//
//  PurchaseOptionView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/30.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseOptionView : UIView {
  
  //MARK: - Properties
  private let titleLabel : UILabel = {
    let lb = UILabel()
    lb.text = "옵션"
    lb.textAlignment = .left
    lb.font = UIFont.boldSystemFont(ofSize: 18)
    lb.textColor = .black
    return lb
  }()
  
  private
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
