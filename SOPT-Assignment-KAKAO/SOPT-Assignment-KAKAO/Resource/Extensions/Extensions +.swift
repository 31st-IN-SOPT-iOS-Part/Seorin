//
//  Extention.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
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
