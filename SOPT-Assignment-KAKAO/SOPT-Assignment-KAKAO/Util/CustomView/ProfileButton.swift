//
//  ProfileButton.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/25.
//

import Foundation
import UIKit

enum ProfileButtonType{
    case chatButton
    case editButton
    case kakaoStoryButton
}
final class ProfileButton : UIButton{
    
    
    init(frame: CGRect, profileButtonType: ProfileButtonType) {
        super.init(frame: frame)
        self.tintColor = .white
        self.titleLabel?.font = UIFont.systemFont(ofSize:15)
        
        switch profileButtonType{
        case .chatButton:
            self.setImage(Image.profileMessageButtonImg, for: .normal)
        case .editButton: self.setTitle("프로필 편집", for: .normal)
            self.setImage(Image.profileEditButtonImg, for: .normal)
        case .kakaoStoryButton: self.setTitle("카카오스토리", for: .normal)
            self.setImage(Image.profileStoryButtonImg, for: .normal)
        }
        alignTextBelow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func alignTextBelow(spacing: CGFloat = 8.0) {
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
