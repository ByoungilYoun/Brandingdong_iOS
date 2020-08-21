//
//  ProductSearchView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import SnapKit

class ProductSearchView: UIView {
  // MARK: - Property
  
  private let logoLabel: UILabel = {
    let lb = UILabel()
    lb.text = "B R A N D I"
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.textColor = .black
    return lb
  }()
  
  private let searchTextfield: UITextField = {
    let tf = UITextField()
    tf.backgroundColor = .systemGray6
    tf.placeholder = "상품을 검색해보세요"
    return tf
  }()
  
  private let basketButton = UIButton()
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    
    [logoLabel, searchTextfield, basketButton].forEach {
      self.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let margin: CGFloat = 15
    
    [logoLabel, searchTextfield, basketButton].forEach {
      $0.snp.makeConstraints {
        $0.centerY.equalToSuperview()
      }
    }
    
    searchTextfield.snp.makeConstraints {
      $0.leading.equalTo(logoLabel.snp.trailing).offset(margin)
      $0.centerY.equalToSuperview()
    }
  }
}
