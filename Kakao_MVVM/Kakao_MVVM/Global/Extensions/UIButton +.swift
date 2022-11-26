//
//  UIButton +.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/11/17.
//

import Foundation
import UIKit

extension UIButton {
    public func configureButton(title : String){
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 5
    }
}
