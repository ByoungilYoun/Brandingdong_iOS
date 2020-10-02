//
//  FavoriteProductEmptyView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class FavoriteProductEmptyViewCell: UICollectionViewCell {
  // MARK: - Property
  
  private let infoImageView = UIImageView()
  private let recommendProductButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("추천상품 보러가기", for: .normal)
    btn.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
    btn.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    return btn
  }()
  
  
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
    
    infoImageView.image = UIImage(named: "찜")
    
    [infoImageView,
     recommendProductButton].forEach {
      self.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 32
    let margin: CGFloat = 8
    
    [infoImageView,
     recommendProductButton].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
        $0.trailing.equalToSuperview().offset(-padding)
      }
     }
    
    infoImageView.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
    }
    
    recommendProductButton.snp.makeConstraints {
      $0.top.equalTo(infoImageView.snp.bottom).offset(margin)
    }
    
    recommendProductButton.clipsToBounds = true
    recommendProductButton.layer.cornerRadius = 15
  }
}
