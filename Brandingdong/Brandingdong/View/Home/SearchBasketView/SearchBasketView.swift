//
//  SearchBasketView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/24.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SearchBasketView: UIView {
    // MARK: - Property
    
    private let logoLabel: UILabel = {
      let lb = UILabel()
      lb.text = "B R A N D I"
      lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
      return lb
    }()
    
    private let searchTextfield: UITextField = {
      let tf = UITextField()
      tf.backgroundColor = .systemGray6
      tf.placeholder = "상품을 검색해보세요"
      tf.layer.cornerRadius = 15
      return tf
    }()
    
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 25)
    
    lazy var basketButton: UIButton = {
      let btn = UIButton()
      btn.setImage(UIImage(systemName: "cart", withConfiguration: largeConfig), for: .normal)
      btn.tintColor = .black
      return btn
    }()
    
    private let searchTextfieldImageView = SearchTextfieldImageView()
    
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
      searchTextfield.leftView = searchTextfieldImageView
      searchTextfield.leftViewMode = .always
      
      basketButton.contentMode = .scaleAspectFit
      
      
      [logoLabel, searchTextfield, basketButton].forEach {
        self.addSubview($0)
      }
    }
    
    private func setConstraints() {
      
      let padding: CGFloat = 8
      let logoWidth: CGFloat = 80
      let buttonWidth: CGFloat = 50
      
      [logoLabel, searchTextfield, basketButton].forEach {
        $0.snp.makeConstraints {
          $0.centerY.equalToSuperview()
        }
      }
      
      logoLabel.snp.makeConstraints {
        $0.width.equalTo(logoWidth)
        $0.leading.equalToSuperview()
      }
      
      searchTextfield.snp.makeConstraints {
        $0.top.bottom.equalToSuperview()
        $0.leading.equalTo(logoLabel.snp.trailing).offset(padding)
        $0.trailing.equalTo(basketButton.snp.leading).offset(-padding)
      }
      
      basketButton.snp.makeConstraints {
        $0.width.equalTo(buttonWidth)
        $0.top.bottom.equalToSuperview()
        $0.trailing.equalToSuperview()
      }
    }
}
