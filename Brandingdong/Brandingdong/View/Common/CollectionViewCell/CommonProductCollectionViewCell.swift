//
//  CommonProductCollectionViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/14.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class CommonProductCollectionViewCell: UICollectionViewCell {
  //MARK: - Properties
  static let identifer = "CommonProductCollectionViewCell"
  
  var imageView : UIImageView = {
    let im = UIImageView()
    im.contentMode = .scaleAspectFill
    im.clipsToBounds = true
    im.layer.cornerRadius = 10
    return im
  }()
  
  var companyLabel : UILabel = {
    let lb = UILabel()
    lb.textColor = .black
    lb.textAlignment = .left
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    return lb
  }()
  
  var descriptionLabel : UILabel = {
    let lb = UILabel()
    lb.textColor = .lightGray
    lb.textAlignment = .left
    lb.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
    return lb
  }()
  
  var priceLabel : UILabel = {
    let lb = UILabel()
    lb.textColor = .black
    lb.textAlignment = .left
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 14)
    return lb
  }()
  
  var heartButton : UIButton = {
    let bt = UIButton()
    bt.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    bt.tintColor = UIColor.white.withAlphaComponent(0.8)
    return bt
  }()
  
  var buttonToggle = false
  
  //MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setUI()
    setConstraints()
    didTabHeartButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: - setUI()
  private func setUI() {
    [imageView,
     companyLabel,
     descriptionLabel,
     priceLabel,
     heartButton].forEach {
      contentView.addSubview($0)
    }
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalTo(self)
      $0.height.equalTo(self).multipliedBy(0.7)
    }
    
    companyLabel.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom)
      $0.leading.trailing.equalTo(self)
      $0.height.equalTo(self).multipliedBy(0.1)
    }
    
    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(companyLabel.snp.bottom)
      $0.leading.trailing.equalTo(self)
      $0.height.equalTo(self).multipliedBy(0.1)
    }
    
    priceLabel.snp.makeConstraints {
      $0.top.equalTo(descriptionLabel.snp.bottom)
      $0.leading.trailing.equalTo(self)
      $0.height.equalTo(self).multipliedBy(0.1)
    }
    
    heartButton.snp.makeConstraints {
      $0.trailing.bottom.equalTo(imageView)
      $0.width.height.equalTo(40)
    }
  }
  
  private func didTabHeartButton() {
    heartButton.addTarget(self, action: #selector(clickedBtn), for: .touchUpInside)
  }

  @objc func clickedBtn(_ sender : UIButton) {
    if !buttonToggle {
     heartButton.tintColor = .systemRed
      print ()
      buttonToggle = !buttonToggle
    } else {
      heartButton.tintColor = UIColor.white.withAlphaComponent(0.8)
       buttonToggle = !buttonToggle
    }
  }
  
  //MARK: - configure()
  func configure(image : UIImage, company : String, description : String, price : String ) {
    imageView.image = image
    companyLabel.text = company
    descriptionLabel.text = description
    priceLabel.text = price
  }
}
