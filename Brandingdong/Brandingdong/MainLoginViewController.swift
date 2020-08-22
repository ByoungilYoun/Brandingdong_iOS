//
//  MainLoginViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/08/20.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit
import SnapKit

class MainLoginViewController : UIViewController {
  
  //MARK: - Properties
  private let backgroundImage = UIImageView(image: UIImage(named: "brandi"))
  
  private let titleLabel : UILabel = {
    let lb = UILabel()
    lb.text = "B R A N D I"
    lb.textAlignment = .center
    lb.font = UIFont.boldSystemFont(ofSize: 20)
    lb.textColor = .white
    return lb
  }()
  
  private let descriptionLabel : UILabel = {
    let lb = UILabel()
    let attributeTitle = NSMutableAttributedString(string: "지금 가입하면 무료 배송은 기본!\n오늘 사서 내일 입는\n", attributes: [.font : UIFont(name: "AppleSDGothicNeo-Regular", size: 18)!, .foregroundColor : UIColor.white])
    attributeTitle.append(NSAttributedString(string: "로켓보다 빠른 하루배송까지!", attributes: [.font : UIFont.boldSystemFont(ofSize: 20), .foregroundColor : UIColor.white]))
    lb.attributedText = attributeTitle
    lb.numberOfLines = 3
    return lb
  }()
  
  private let couponLabel : UILabel = {
    let lb = UILabel()
    let attributeTitle = NSMutableAttributedString(string: "1만원 상당", attributes: [.font : UIFont.boldSystemFont(ofSize: 16), .foregroundColor : UIColor.white])
    attributeTitle.append(NSAttributedString(string: "의 쿠폰 혜택도 받아가세요", attributes: [.font : UIFont(name: "AppleSDGothicNeo-Regular", size: 16)!, .foregroundColor : UIColor.white]))
    lb.attributedText = attributeTitle
    return lb
  }()
  
  private lazy var stackView = UIStackView()
  
  private let emailLoginButton : LocalLoginButton = {
    let bt = LocalLoginButton(title: "이메일로 가입하기", color: .systemPink)
    return bt
  }()
  
  private let appleLoginButton : SocialLoginButton = {
    let viewModel = SocialCustomLoginViewModel(title: "Apple로 계속하기", image: "appleLogo")
    let bt = SocialLoginButton(with: viewModel, color: UIColor.black)
    bt.backgroundColor = UIColor.white
    return bt
  }()
  
  private let facebookLoginButton : SocialLoginButton = {
    let viewModel = SocialCustomLoginViewModel(title: "Facebook으로 계속하기", image: "google")
    let bt = SocialLoginButton(with: viewModel, color: .white)
    bt.backgroundColor = UIColor.systemBlue
    return bt
  }()
  
  private let googleLoginButton : SocialLoginButton = {
    let viewModel = SocialCustomLoginViewModel(title: "Google 계정으로 계속하기", image: "google")
    let bt = SocialLoginButton(with: viewModel, color: .lightGray)
    bt.backgroundColor = UIColor.white
    return bt
  }()
  
  private let dividerView = DividerView()
  
  private let loginButton : LocalLoginButton = {
    let bt = LocalLoginButton(title: "로그인", color: .black)
    return bt
  }()
  
  private let informationView = InformationView()
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
  }
  
  //MARK: - setUI()
  private func setUI() {
    [backgroundImage, titleLabel, descriptionLabel, couponLabel].forEach {
      view.addSubview($0)
    }
    
      stackView = UIStackView(arrangedSubviews: [emailLoginButton, appleLoginButton, facebookLoginButton, googleLoginButton, dividerView ,loginButton])
      stackView.axis = .vertical
      stackView.spacing = 20
      view.addSubview(stackView)
  
    view.addSubview(informationView)
  }
  
  //MARK: - setConstraint()
  private func setConstraints() {
    backgroundImage.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.bottom.equalToSuperview()
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(70)
      $0.leading.equalToSuperview().offset(30)
    }
    
    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(40)
      $0.leading.equalToSuperview().offset(30)
    }
    
    couponLabel.snp.makeConstraints {
      $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(30)
    }
    
    stackView.snp.makeConstraints {
      $0.top.equalTo(couponLabel.snp.bottom).offset(100)
      $0.leading.equalToSuperview().offset(20)
      $0.trailing.equalToSuperview().offset(-20)
    }
    
    informationView.snp.makeConstraints {
      $0.top.equalTo(stackView.snp.bottom).offset(150)
      $0.leading.equalToSuperview()
      $0.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-40)
    }
  }
  
}
