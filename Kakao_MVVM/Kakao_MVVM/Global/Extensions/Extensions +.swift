//
//  Extensions +.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import Foundation
import UIKit

protocol ReusableView: AnyObject {
}

extension ReusableView where Self: UIView {
  static var identifier: String {
    return String(describing: self)
  }
}


extension UIButton {
    public func configureButton(title : String){
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.titleLabel?.textAlignment = .center
        self.backgroundColor = .systemGray6
        self.layer.cornerRadius = 5
    }
}

extension Int {
  public var color: UIColor {
    let red = CGFloat(self as Int >> 16 & 0xff) / 255
    let green = CGFloat(self >> 8 & 0xff) / 255
    let blue  = CGFloat(self & 0xff) / 255
    return UIColor(red: red, green: green, blue: blue, alpha: 1)
  }
}

