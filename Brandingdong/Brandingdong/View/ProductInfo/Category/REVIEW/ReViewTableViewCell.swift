//
//  ReViewTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/15.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ReViewTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "ReViewTableViewCell"
  
  private let deviceWidth = UIScreen.main.bounds.width
  
  let reviewCountLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.text = "xx"
    return lb
  }()
  
  let reviewSubLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    lb.text = " 개의 리뷰가 있습니다."
    return lb
  }()
  
  let reviewCountSubView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  let satisfactionLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.text = "만족도"
    return lb
  }()
  
  private let starRatingView = UIView()
  
  let firstStar = UIImageView()
  let secondStar = UIImageView()
  let thirdStar = UIImageView()
  let fourStar = UIImageView()
  let fiveStar = UIImageView()
  
  let satisfactionSubView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  let wearinLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.text = "착용감"
    return lb
  }()
  
  let wearinSubLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 16)
    lb.text = "이 상품은"
    return lb
  }()
  
  let wearinResultLabel: UILabel = {
    let lb = UILabel()
    lb.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 16)
    lb.text = " 잘 맞아요."
    return lb
  }()
  
  let wearinSubView: UIView = {
    let view = UIView()
    view.backgroundColor = .lightGray
    return view
  }()
  
  // MARK: - Cell Init
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
  }
  
  // MARK: - Set LayOut
  
  private func setUI() {
    
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 22)
    
    [reviewCountLabel,
     reviewSubLabel,
     reviewCountSubView,
     satisfactionLabel,
     starRatingView,
     satisfactionSubView,
     wearinLabel,
     wearinSubLabel,
     wearinResultLabel,
     wearinSubView].forEach {
      contentView.addSubview($0)
    }
    
    [firstStar,
     secondStar,
     thirdStar,
     fourStar,
     fiveStar].forEach {
      $0.image = UIImage(systemName: "star.fill", withConfiguration: largeConfig)
      $0.tintColor = .systemYellow
      starRatingView.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let padding: CGFloat = 16
    let starRatingViewPadding: CGFloat = 16
    let starRatingViewWidth: CGFloat = 150
    let starRatingViewHeight: CGFloat = 50
    let subViewHeight: CGFloat = 1
    
    [reviewCountLabel,
     satisfactionLabel,
     wearinLabel].forEach {
      $0.snp.makeConstraints {
        $0.leading.equalToSuperview().offset(padding)
      }
    }
    
    reviewCountLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(padding)
    }
    
    reviewSubLabel.snp.makeConstraints {
      $0.leading.equalTo(reviewCountLabel.snp.trailing)
      $0.centerY.equalTo(reviewCountLabel)
    }
    
    reviewCountSubView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(reviewCountLabel.snp.bottom).offset(padding)
      $0.height.equalTo(subViewHeight)
    }
    
    satisfactionLabel.snp.makeConstraints {
      $0.top.equalTo(reviewCountSubView.snp.bottom).offset(padding)
    }
    
    starRatingView.snp.makeConstraints {
      $0.centerY.equalTo(satisfactionLabel.snp.centerY)
      $0.trailing.equalToSuperview().offset(-starRatingViewPadding)
      $0.width.equalTo(starRatingViewWidth)
      $0.height.equalTo(starRatingViewHeight)
    }
    
    [firstStar,
    secondStar,
    thirdStar,
    fourStar,
    fiveStar].forEach {
      $0.snp.makeConstraints {
        $0.centerY.equalTo(starRatingView.snp.centerY)
      }
    }
    
    firstStar.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
    secondStar.snp.makeConstraints {
      $0.leading.equalTo(firstStar.snp.trailing)
    }
    thirdStar.snp.makeConstraints {
      $0.leading.equalTo(secondStar.snp.trailing)
    }
    fourStar.snp.makeConstraints {
      $0.leading.equalTo(thirdStar.snp.trailing)
    }
    fiveStar.snp.makeConstraints {
      $0.leading.equalTo(fourStar.snp.trailing)
    }
    
    satisfactionSubView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(satisfactionLabel.snp.bottom).offset(padding)
      $0.height.equalTo(subViewHeight)
    }
    
    wearinLabel.snp.makeConstraints {
      $0.top.equalTo(satisfactionSubView.snp.bottom).offset(padding)
    }
    
    wearinResultLabel.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-padding)
      $0.centerY.equalTo(wearinLabel.snp.centerY)
    }
    
    wearinSubLabel.snp.makeConstraints {
      $0.trailing.equalTo(wearinResultLabel.snp.leading)
      $0.centerY.equalTo(wearinLabel.snp.centerY)
    }
    
    wearinSubView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(wearinLabel.snp.bottom).offset(padding)
      $0.height.equalTo(subViewHeight)
    }
  }
}
