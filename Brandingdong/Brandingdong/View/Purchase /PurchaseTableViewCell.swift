//
//  PurchaseTableViewCell.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseTableViewCell : UITableViewCell {
  
  //MARK: - Properties
  static let identifier = "PurchaseTableViewCell"
  
  let checkButton : UIButton = {
    let bt = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
    bt.setImage(UIImage(systemName: "circle"), for: .normal)
    bt.tintColor = .lightGray
    return bt
  }()
  
  //MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    accessoryView = checkButton
  
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
  


