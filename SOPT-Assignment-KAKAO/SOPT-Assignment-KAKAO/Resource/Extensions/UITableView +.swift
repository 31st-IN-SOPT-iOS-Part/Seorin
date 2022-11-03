//
//  UITableView +.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/24.
//

import Foundation
import UIKit

extension UITableViewCell: ReusableView {}

extension UITableView{
    func register<T: UITableViewCell>(_ cellClass: T.Type){
        let identifier = T.identifier
        self.register(T.self, forCellReuseIdentifier: identifier)
    }
}
