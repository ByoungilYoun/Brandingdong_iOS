//
//  FooterCollectionReusableView.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/06.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FooterCollectionReusableView : UICollectionReusableView {
  //MARK: - Properties
  static let identifier = "FooterCollectionReusableView"
  
  private let label = UILabel()
  
  public func configure(withColor color : UIColor) {
    addSubview(label)
    backgroundColor = color.withAlphaComponent(0.2)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    label.frame = bounds
  }
}
