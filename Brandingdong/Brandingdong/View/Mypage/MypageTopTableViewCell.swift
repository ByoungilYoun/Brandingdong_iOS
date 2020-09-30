//
//  MypageTopView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/29.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class MypageTopTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "MypageTopTableViewCell"
  
  private let deviceWidrth = UIScreen.main.bounds.width
  
  let pointView: MypageTopView = {
    let point = MypageTopView(image: Mypage.myPageTopViewImageArr[0]!,
                              title: "포인트",
                              count: String(0))
    return point
  }()
  
  let couponView: MypageTopView = {
    let coupon = MypageTopView(image: Mypage.myPageTopViewImageArr[1]!,
                               title: "쿠폰",
                               count: String(0))
    return coupon
  }()
  
  let orderCheckView: MypageTopView = {
    let order = MypageTopView(image: Mypage.myPageTopViewImageArr[2]!,
                              title: "배송조회",
                              count: nil)
    return order
  }()

   // MARK: - Cell init
   
   override func awakeFromNib() {
     super.awakeFromNib()
   }
   
   override func setSelected(_ selected: Bool, animated: Bool) {
     super.setSelected(selected, animated: animated)
     setUI()
     setConstraints()
   }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [pointView,
     couponView,
     orderCheckView].forEach {
      $0.layer.borderWidth = 1
      $0.layer.borderColor = UIColor.lightGray.cgColor
      contentView.addSubview($0)
     }
  }
  
  private func setConstraints() {
    let topViewHeight: CGFloat = 102
    let topViewWidth: CGFloat = (deviceWidrth / 3)
    
    [pointView,
     couponView,
     orderCheckView].forEach {
      $0.snp.makeConstraints {
        $0.top.equalToSuperview()
        $0.height.equalTo(topViewHeight)
        $0.width.equalTo(topViewWidth)
      }
     }
    
    pointView.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
    
    couponView.snp.makeConstraints {
      $0.leading.equalTo(pointView.snp.trailing)
    }
    
    orderCheckView.snp.makeConstraints {
      $0.leading.equalTo(couponView.snp.trailing)
    }
  }
}
