//
//  User.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import Foundation
import UIKit

struct User{
    var name : String
    var profileImg : UIImage
    var stateMessage : String
    
    
    init(name : String, profileImg: UIImage = Image.defaultProfileImage!, stateMessage: String = ""){
        self.name = name
        self.profileImg = profileImg
        self.stateMessage = stateMessage
    }
    
}
