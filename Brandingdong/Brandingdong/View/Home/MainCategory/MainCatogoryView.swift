//
//  MainCategoryView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/08/23.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
protocol ChangeViewDelegate {
  func changeView(index : Int)
}

class MainCategoryView: UIView {
  // MARK: - Property
  
  private let categoryButtonView = UIView()
  
  private let shoopingMarketButton: CategoryMenuButton = {
    let btn = CategoryMenuButton(title: "쇼핑몰*마켓")
    btn.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
    btn.tag = 0
    return btn
  }()
  
  private let brandButton: CategoryMenuButton = {
    let btn = CategoryMenuButton(title: "브랜드")
    btn.tag = 1
    return btn
  }()
  
  private let beautyButton: CategoryMenuButton = {
    let btn = CategoryMenuButton(title: "뷰티")
    btn.tag = 2
    return btn
  }()
  
  private let categorySubLine: UIView = {
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
    return view
  }()
  
  var delegate : ChangeViewDelegate?
  
  // MARK: - Init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    setTargetButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  // MARK: - Setup Layout
  
  private func setUI() {
    
    self.addSubview(categoryButtonView)
    
    [shoopingMarketButton,
     brandButton,
     beautyButton,
     categorySubLine].forEach {
      categoryButtonView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    
    categoryButtonView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    
    [shoopingMarketButton,
     brandButton,
     beautyButton].forEach {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(categoryButtonView.snp.centerY)
        $0.width.equalToSuperview().multipliedBy(0.33)
      }
     }
    
    shoopingMarketButton.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
    
    brandButton.snp.makeConstraints {
      $0.leading.equalTo(shoopingMarketButton.snp.trailing)
    }
    
    beautyButton.snp.makeConstraints {
      $0.leading.equalTo(brandButton.snp.trailing)
    }
    
    categorySubLine.snp.makeConstraints {
      $0.top.equalTo(shoopingMarketButton.snp.bottom)
      $0.width.equalTo(shoopingMarketButton.snp.width)
      $0.leading.equalToSuperview()
      $0.height.equalTo(2)
    }
  }
  
  // MARK: - Action Button
  
  private func setTargetButton() {
    [shoopingMarketButton,
     brandButton,
     beautyButton].forEach {
      $0.addTarget(self, action: #selector(didTapButton(sender:)), for: .touchUpInside)
     }
  }
  
  private func getChangeButtonTarget(buttonName: UIButton) {
    
    categorySubLine.snp.removeConstraints()
    
    UIView.animate(withDuration: 0.3) { [self] in
      categorySubLine.snp.makeConstraints {
        $0.top.equalTo(buttonName.snp.bottom)
        $0.width.equalTo(buttonName)
        $0.leading.equalTo(buttonName.snp.leading)
        $0.height.equalTo(2)
      }
      self.layoutIfNeeded()
    }
    
    switch buttonName {
    case shoopingMarketButton:
      shoopingMarketButton.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
      brandButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
      beautyButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    case brandButton:
      shoopingMarketButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
      brandButton.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
      beautyButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
    case beautyButton:
      shoopingMarketButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
      brandButton.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
      beautyButton.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
    default:
      break
    }
  }
  
  @objc func didTapButton(sender: UIButton) {
    switch sender {
    case shoopingMarketButton:
      getChangeButtonTarget(buttonName: shoopingMarketButton)
      delegate?.changeView(index: shoopingMarketButton.tag)
      
    case brandButton:
      getChangeButtonTarget(buttonName: brandButton)
      delegate?.changeView(index: brandButton.tag)
      
    case beautyButton:
      getChangeButtonTarget(buttonName: beautyButton)
      delegate?.changeView(index: beautyButton.tag)
      
    default:
      break
    }
  }
}

