//
//  SocialLoginButton.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class SocialLoginButton : UIButton {
  
  //MARK: - Properties
  private let buttonIconImage : UIImageView = {
    let im = UIImageView()
    return im
  }()
  
  private let buttonTitleLabel : UILabel = {
    let lb = UILabel()
    lb.textAlignment = .center
    return lb
  }()
  
  private var viewModel : SocialCustomLoginViewModel
  //MARK: - init
  
  init(with viewModel : SocialCustomLoginViewModel, color : UIColor) {
    self.viewModel = viewModel
    super.init(frame: .zero)
    
    buttonTitleLabel.textColor = color
    configure(with: viewModel)
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    layer.masksToBounds = true
    layer.cornerRadius = 10
    
    addSubview(buttonIconImage)
    addSubview(buttonTitleLabel)
  }
  
  //MARK: - layoutSubViews()
  override func layoutSubviews() {
    super.layoutSubviews()
    
    buttonIconImage.snp.makeConstraints {
      $0.centerY.equalTo(self)
      $0.leading.equalTo(self).offset(10)
      $0.height.width.equalTo(30)
    }
    
    buttonTitleLabel.snp.makeConstraints {
      $0.centerX.equalTo(self)
      $0.centerY.equalTo(self)
    }
  }
  
  //MARK: - configure()
  public func configure(with viewModel : SocialCustomLoginViewModel) {
    setUI()
    
    buttonIconImage.image = UIImage(named: viewModel.image)
    buttonTitleLabel.text = viewModel.title
  }
  
}
