//
//  UITextField +.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/21.
//

import Foundation
import UIKit

extension UITextField {
    
    public func configureTextField(placeholder : String){
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
        self.backgroundColor = .systemGray6
        self.clearButtonMode = .whileEditing
    }
}
