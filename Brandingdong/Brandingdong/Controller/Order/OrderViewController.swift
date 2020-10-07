//
//  OrderViewController.swift
//  Brandingdong
//
//  Created by 윤병일 on 2020/10/03.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class OrderViewController : UIViewController {
  
  //MARK: - Properties
  private let tableView = UITableView()
  let fomatter = NumberFormatter()
  
  //MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setUI()
    setConstraints()
    priceFommater()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setNavi()
  }
  
  //MARK: - setNavi()
  private func setNavi() {
    navigationController?.navigationBar.isHidden = false
    title = "주문하기"
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(moveBack))
    navigationItem.leftBarButtonItem?.tintColor = .black
  }
  
  //MARK: - setUI()
  private func setUI() {
    tableView.dataSource = self
    tableView.delegate = self
    tableView.register(CustomerInfoCell.self, forCellReuseIdentifier: CustomerInfoCell.identifier)
    tableView.register(LocationInfoCell.self, forCellReuseIdentifier: LocationInfoCell.identifier)
    tableView.register(DeliveryRequireCell.self, forCellReuseIdentifier: DeliveryRequireCell.identifier)
    tableView.register(DeliveryProductCell.self, forCellReuseIdentifier: DeliveryProductCell.identifier)
    tableView.register(PointCell.self, forCellReuseIdentifier: PointCell.identifier)
    tableView.register(HowToPayCell.self, forCellReuseIdentifier: HowToPayCell.identifier)
    tableView.register(TotalPriceCell.self, forCellReuseIdentifier: TotalPriceCell.identifer)
    tableView.allowsSelection = false
    tableView.tableFooterView = UIView()
    view.addSubview(tableView)
  }
  
  //MARK: - setConstraints()
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.top.equalTo(view.safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide)
    }
  }
  
  // MARK: - PriceFommater
  
  private func priceFommater() {
    fomatter.numberStyle = .decimal
    fomatter.minimumFractionDigits = 0
    fomatter.maximumFractionDigits = 3
  }
  
  //MARK: - @objc func
  @objc private func moveBack() {
    navigationController?.popViewController(animated: true)
  }
}

//MARK: - UITableViewDataSource
extension OrderViewController : UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
    let view = UIView()
    view.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
    return view
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return 7
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 7
  }
  
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: CustomerInfoCell.identifier, for: indexPath) as! CustomerInfoCell
      tableView.rowHeight = 250
      return cell
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: LocationInfoCell.identifier, for: indexPath) as! LocationInfoCell
      tableView.rowHeight = 150
      return cell
    } else if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryRequireCell.identifier, for: indexPath) as! DeliveryRequireCell
      tableView.rowHeight = 120
      return cell
    } else if indexPath.section == 3 {
      let cell = tableView.dequeueReusableCell(withIdentifier: DeliveryProductCell.identifier, for: indexPath) as! DeliveryProductCell
      tableView.rowHeight = 200
      cell.configure(image : ProductInfo.checkProductNameImageArr.first!,
                     company: ProductInfo.checkProductBrandName,
                     productTitle: ProductInfo.checkProductName,
                     productSubDetail: ProductOption.selectedChoice.first! + " / " + ProductOption.selectedChoice.last! + " / " + "수량 1개",
                     price: fomatter.string(from: ProductInfo.checkProductPrice as NSNumber)! + " 원")
      return cell
    } else if indexPath.section == 4 {
      let cell = tableView.dequeueReusableCell(withIdentifier: PointCell.identifier, for: indexPath) as! PointCell
      tableView.rowHeight = 230
      cell.delegate = self
      cell.configure(havingPoint: "2000원",
                     usingPoint: "0원",
                     havingPoint2: "2000원")
      return cell
    } else if indexPath.section == 5 {
      let cell = tableView.dequeueReusableCell(withIdentifier: HowToPayCell.identifier, for: indexPath) as! HowToPayCell
      tableView.rowHeight = 350
      cell.configure(howToPay: "네이버페이로 결제")
      return cell
    } else if indexPath.section == 6 {
      let cell = tableView.dequeueReusableCell(withIdentifier: TotalPriceCell.identifer, for: indexPath) as! TotalPriceCell
      cell.delegate = self
      tableView.rowHeight = 130
      cell.configure(price: fomatter.string(from: ProductInfo.checkProductPrice as NSNumber)! + " 원")
      return cell
    } else {
      return UITableViewCell()
    }
  }
  
  
}

//MARK: - UITableViewDelegate
extension OrderViewController : UITableViewDelegate {
  
}

extension OrderViewController : TotalPriceCellDelegate {
  func buyButtonClicked() {
    let alert = UIAlertController(title: "결제완료", message: "결제가 완료되었습니다.", preferredStyle: .alert)
    let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
    alert.addAction(alertAction)
    present(alert, animated: true, completion: nil)
  }
}

extension OrderViewController : PointCellDelegate {
  func useAllPointButtonClick() {
    let view = PointCell()
    view.pointTextLabel.isHidden = false
    view.pointTextLabel.text = "2000"
    view.pointTextLabel.alpha = 1
  }
}
