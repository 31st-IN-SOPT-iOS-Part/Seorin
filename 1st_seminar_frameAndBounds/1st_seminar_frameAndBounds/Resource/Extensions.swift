//
//  Extention.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
//

import Foundation
import UIKit

extension UIView{
    public var width : CGFloat{
        return frame.size.width
    }
    
    public var height : CGFloat{
        return frame.size.height
    }

    public var top : CGFloat{
        return frame.origin.y
    }

    public var bottom : CGFloat{
        return frame.origin.y + frame.size.height
    }

    public var left : CGFloat{
        return frame.origin.x
    }

    public var right : CGFloat{
        return frame.origin.x + frame.size.width
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
extension UITextField{
    public func configureTextField(placeholder : String){
        self.placeholder = placeholder
        self.borderStyle = .roundedRect
        self.backgroundColor = .systemGray6
        self.clearButtonMode = .whileEditing
    }
}
