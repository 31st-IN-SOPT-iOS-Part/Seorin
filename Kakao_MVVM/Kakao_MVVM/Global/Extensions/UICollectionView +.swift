//
//  UICollectionView +.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import Foundation
import UIKit

//extension UICollectionViewCell: ReusableView {}
//
//extension UICollectionView{
//    func register<T: UICollectionViewCell>(_ cellClass: T.Type){
//        let identifier = T.identifier
//        self.register(T.self, forCellWithReuseIdentifier: identifier)
//    }
//}


protocol UICollectionViewRegisterable {
     static var isFromNib: Bool { get }
     static func register(target: UITableView)
 }

 extension UICollectionViewRegisterable where Self: UICollectionViewCell {
     static func register(target: UICollectionView) {
         target.register(Self.self, forCellWithReuseIdentifier: Self.className)
         /*
         if self.isFromNib {
             target.register(UINib(nibName: Self.className, bundle: nil), forCellWithReuseIdentifier: Self.className)
         } else {
             target.register(Self.self, forCellWithReuseIdentifier: Self.className)
         }
          */
     }
 }
