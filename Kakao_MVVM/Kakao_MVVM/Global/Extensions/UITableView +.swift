//
//  UITableView +.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import Foundation
import UIKit


protocol UITableViewRegisterable {
     static var isFromNib: Bool { get }
     static func register(target: UITableView)
 }

 extension UITableViewRegisterable where Self: UITableViewCell {
     static func register(target: UITableView) {
         target.register(Self.self, forCellReuseIdentifier: Self.className)
         /*
         if self.isFromNib {
             target.register(UINib(nibName: Self.className, bundle: nil), forCellReuseIdentifier: Self.className)
         } else {
             target.register(Self.self, forCellReuseIdentifier: Self.className)
         }
          */
     }
 }
