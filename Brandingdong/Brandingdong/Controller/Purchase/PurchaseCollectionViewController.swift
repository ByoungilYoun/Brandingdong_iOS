//
//  PurchaseCollectionViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/09/30.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class PurchaseCollectionViewController : UIViewController {
  
  //MARK: - Properties
  private let optionLabel : UILabel = {
    let lb = UILabel()
    lb.text = "옵션"
    lb.textAlignment = .center
    lb.textColor = .black
    lb.font = UIFont.boldSystemFont(ofSize: 20)
    return lb
  }()
  
  private let optionView : PurchaseOptionView = {
    let view = PurchaseOptionView()
    view.layer.borderWidth = 1
    view.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.6).cgColor
    view.layer.cornerRadius = 5
    return view
  }()
  
  var gesture : UITapGestureRecognizer?
  
  private let collectionView : UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    return UICollectionView(frame: .zero, collectionViewLayout: layout)
  }()
  
  private let totalProductCountLabel : UILabel = {
    let lb = UILabel()
    lb.text = "총 1개의 상품"
    lb.textColor = UIColor.lightGray.withAlphaComponent(0.8)
    return lb
  }()
  
  private let totalPriceLabel : UILabel = {
    let lb = UILabel()
    let attributes : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor.black, .font : UIFont.systemFont(ofSize: 16)]
    let attributedTitle = NSMutableAttributedString(string: "총 금액 ", attributes: attributes)
    let priceAtts : [NSAttributedString.Key : Any] = [.foregroundColor : UIColor.systemPink, .font : UIFont.boldSystemFont(ofSize: 18)]
    attributedTitle.append(NSAttributedString(string: "39,900원", attributes: priceAtts))
    lb.attributedText = attributedTitle
    return lb
  }()
  
  private let lineView : UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    return view
  }()
  
  private let cartButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("장바구니", for: .normal)
    bt.setTitleColor(.black, for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
    bt.layer.cornerRadius = 5
    bt.addTarget(self, action: #selector(shoppingBasketClicked), for: .touchUpInside)
    return bt
  }()
  
  private let buyNowButton : UIButton = {
    let bt = UIButton()
    bt.setTitle("바로 구매", for: .normal)
    bt.setTitleColor(.white, for: .normal)
    bt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
    bt.backgroundColor = .black
    bt.layer.cornerRadius = 5
    bt.addTarget(self, action: #selector(buyNowBtnClicked), for: .touchUpInside)
    return bt
  }()
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    addNotificationCenter()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  //MARK: - setUI()
  private func setUI() {
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    collectionView.register(PurchaseSelectedCell.self, forCellWithReuseIdentifier: PurchaseSelectedCell.identifier)
    
    [optionLabel, optionView, collectionView, totalProductCountLabel, totalPriceLabel, lineView, cartButton, buyNowButton].forEach {
      view.addSubview($0)
    }
  }
  //MARK: - setConstraints()
  private func setConstraints() {
    optionLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(10)
      $0.leading.equalToSuperview().offset(15)
    }
    
    optionView.snp.makeConstraints {
      $0.top.equalTo(optionLabel.snp.bottom).offset(10)
      $0.leading.equalToSuperview().offset(15)
      $0.trailing.equalToSuperview().offset(-15)
      $0.height.equalTo(40)
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(optionView.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(250)
    }
    
    totalProductCountLabel.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom).offset(15)
      $0.leading.equalToSuperview().offset(15)
    }
    
    totalPriceLabel.snp.makeConstraints {
      $0.top.equalTo(collectionView.snp.bottom).offset(15)
      $0.trailing.equalToSuperview().offset(-10)
    }
    
    lineView.snp.makeConstraints {
      $0.top.equalTo(totalProductCountLabel.snp.bottom).offset(10)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    let buttonWidth = (view.frame.size.width - 40) / 2
    
    cartButton.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(10)
      $0.leading.equalToSuperview().offset(15)
      $0.width.equalTo(buttonWidth)
      $0.height.equalTo(50)
    }
    
    buyNowButton.snp.makeConstraints {
      $0.top.equalTo(lineView.snp.bottom).offset(10)
      $0.leading.equalTo(cartButton.snp.trailing).offset(10)
      $0.width.equalTo(buttonWidth)
      $0.height.equalTo(50)
    }
  }
  
  //MARK: - addNotificationCenter()
  private func addNotificationCenter() {
    NotificationCenter.default.addObserver(self, selector: #selector(dismissView), name: NSNotification.Name("DismissView"), object: nil)
    let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissView))
    view.addGestureRecognizer(gesture)
    self.gesture = gesture
  }
  
  //MARK: - @objc func
  @objc private func dismissView(_ tapGestureRecognizer : UITapGestureRecognizer) {
    let location = tapGestureRecognizer.location(in: optionView)
    guard optionView.isHidden == false , optionView.bounds.contains(location) else { return }
    self.view.alpha = 0
    self.view.isHidden = true
  }
  
  @objc private func buyNowBtnClicked() {
    let controller = OrderViewController()
    controller.modalPresentationStyle = .fullScreen
    controller.view.backgroundColor = .systemBackground
    navigationController?.pushViewController(controller, animated: true)
  }
  @objc private func shoppingBasketClicked() {
    let shoppingBasketVC = ShoppingBasketViewController()
    shoppingBasketVC.view.backgroundColor = .systemBackground
    navigationController?.pushViewController(shoppingBasketVC, animated: true)
  }
}

  //MARK: - UICollectionViewDataSource
extension PurchaseCollectionViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PurchaseSelectedCell.identifier, for: indexPath) as! PurchaseSelectedCell
    cell.layer.cornerRadius = 5
    cell.backgroundColor = .systemBackground
    return cell
  }
}
  //MARK: - UICollectionViewDelegate
extension PurchaseCollectionViewController : UICollectionViewDelegate {
  
}

  //MARK: - UICollectionViewDelegateFlowLayout
extension PurchaseCollectionViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = view.frame.size.width - 40
    return CGSize(width: width, height: 100)
  }
}
