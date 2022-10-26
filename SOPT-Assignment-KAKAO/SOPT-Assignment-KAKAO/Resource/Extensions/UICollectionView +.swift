//
//  UICollectionView +.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/24.
//

import Foundation
import UIKit

extension UICollectionViewCell: ReusableView {}

extension UICollectionView{
    func register<T: UICollectionViewCell>(_ cellClass: T.Type){
        let identifier = T.identifier
        self.register(T.self, forCellWithReuseIdentifier: identifier)
    }
}
