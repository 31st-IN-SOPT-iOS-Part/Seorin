//
//  UIButton +.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/21.
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
    
    
    func alignTextBelow(spacing: CGFloat = 8.0) {
            guard let image = self.imageView?.image else {
                return
            }

            guard let titleLabel = self.titleLabel else {
                return
            }

            guard let titleText = titleLabel.text else {
                return
            }

            let titleSize = titleText.size(withAttributes: [
                NSAttributedString.Key.font: titleLabel.font as Any
            ])

        imageEdgeInsets = UIEdgeInsets(top: -(titleSize.height + spacing),
                                       left: 0,
                                       bottom: 0,
                                       right: -titleSize.width)
            titleEdgeInsets = UIEdgeInsets(top: spacing,
                                           left: -image.size.width,
                                           bottom: -image.size.height,
                                           right: 0)
        }
}
