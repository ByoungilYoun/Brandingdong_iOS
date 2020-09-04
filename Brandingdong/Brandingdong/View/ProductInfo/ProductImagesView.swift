//
//  ProductImagesView.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/09/04.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class ProductImagesView: UIView {
  // MARK: - Property
  
  private let deviceWidth = UIScreen.main.bounds.width
  private let scrollView = UIScrollView()
  private let pageControl = UIPageControl()
  
  var productImageArr = ["heart", "person", "checkmark"].compactMap {
    UIImage.init(systemName: $0)
  }
  var productImageViewArr = [UIImageView]()
  
  // MARK: - init View
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setScrollView()
    setPageControl()
    setUI()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Set Property
  
  private func setScrollView() {
    scrollView.backgroundColor = .systemBackground
    scrollView.isPagingEnabled = true
    scrollView.delegate = self
  }
  
  private func setPageControl() {
    pageControl.numberOfPages = productImageArr.count
    pageControl.currentPage = 0
    pageControl.pageIndicatorTintColor = .lightGray
    pageControl.currentPageIndicatorTintColor = .white
    pageControl.addTarget(self, action: #selector(handlePageControl), for: .valueChanged)
  }
  
  // MARK: - Setup Layout
  
  private func setUI() {
    [scrollView, pageControl].forEach {
      self.addSubview($0)
    }
  }
  
  private func setConstraints() {
    
    let margin: CGFloat = 10
    
    scrollView.snp.makeConstraints {
      $0.top.leading.bottom.trailing.equalToSuperview()
    }
    
    pageControl.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview().offset(-margin)
    }
    
    for product in productImageArr {
      
      let productImageView = UIImageView()
      productImageView.backgroundColor = .systemBlue
      productImageView.image = product
      
      productImageViewArr.append(productImageView)
      scrollView.addSubview(productImageView)
      
      productImageView.snp.makeConstraints {
        $0.top.leading.bottom.trailing.equalTo(scrollView)
      }
      
      for (index, value) in productImageViewArr.enumerated() {
        switch index {
        case 0:
          value.snp.makeConstraints { $0.leading.equalTo(scrollView.snp.leading) }
        case productImageViewArr.count - 1:
          value.snp.makeConstraints { $0.trailing.equalTo(scrollView.snp.trailing) }
          fallthrough
        default:
          value.snp.makeConstraints { $0.leading.equalTo(productImageViewArr[index - 1].snp.trailing)}
        }
      }
    }
  }
  
  @objc private func handlePageControl(_ sender: UIPageControl) {
    let moveX = CGFloat(pageControl.currentPage) * deviceWidth
    scrollView.setContentOffset(CGPoint(x: moveX, y: 0), animated: true)
  }
}

// MARK: - UIScrollViewDelegate

extension ProductImagesView: UIScrollViewDelegate {
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.width)
    pageControl.currentPage = Int(pageNumber)
  }
}
