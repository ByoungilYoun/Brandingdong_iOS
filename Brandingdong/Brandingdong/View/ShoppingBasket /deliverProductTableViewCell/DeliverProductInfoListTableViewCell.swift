//
//  DeliverProductInfoListTableViewCell.swift
//  Brandingdong
//
//  Created by 이진욱 on 2020/10/07.
//  Copyright © 2020 jwlee. All rights reserved.
//

import UIKit

class DeliverProductInfoListTableViewCell: UITableViewCell {
  // MARK: - Property
  
  static let identifier = "DeliverProductInfoListTableViewCell"
  
  private let tableView = UITableView()
  
  let fomatter = NumberFormatter()
  
  // MARK: - Cell Init
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    setUI()
    setConstraints()
    setTableView()
    priceFommater()
  }
  
  // MARK: - Set LayOut
  
  private func setUI() {
    self.addSubview(tableView)
  }
  
  private func setConstraints() {
    tableView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  // MARK: - Set TableView
  
  private func setTableView() {
    tableView.dataSource = self
    tableView.rowHeight = 242
    
    tableView.register(DeliverProductInfoTableViewCell.self,
                       forCellReuseIdentifier: DeliverProductInfoTableViewCell.identifier)
  }
  
  private func priceFommater() {
    fomatter.numberStyle = .decimal
    fomatter.minimumFractionDigits = 0
    fomatter.maximumFractionDigits = 3
  }
}

extension DeliverProductInfoListTableViewCell: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: DeliverProductInfoTableViewCell.identifier,
                                             for: indexPath) as! DeliverProductInfoTableViewCell
    
    cell.configure(brandName: ProductInfo.checkProductBrandName,
                   productImage: (ProductInfo.checkProductNameImageArr.first ?? UIImage(systemName: "heart"))!,
                   productName: ProductInfo.checkProductName,
                   colorName: ProductOption.selectedChoice.first ?? "",
                   sizeName: ProductOption.selectedChoice.last ?? "",
                   price: fomatter.string(from: ProductInfo.checkProductPrice as NSNumber)! + " 원")
    return cell
  }
}
