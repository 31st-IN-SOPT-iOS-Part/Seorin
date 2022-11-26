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
    
    init(name : String, profileImg: UIImage, stateMessage: String){
        self.name = name
        self.profileImg = profileImg
        self.stateMessage = stateMessage
    }
    
    init(name: String){
        self.name = name
        self.profileImg = Image.defaultProfileImage!
        self.stateMessage = ""
//        self.init(name: name, profileImg: Image.defaultProfileImage!, stateMessage: "")
    }
}


