//
//  SignUpViewModel.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/22.
//

import Foundation
import RxSwift

final class SignUpViewModel {
    var disposeBag = DisposeBag()
    var userEmail: Observable<String>
    var userPassword: Observable<String>
    
    var email : String
    var password : String
    
    init(_ user : User){
        self.email = user.email
        self.password = user.password
    }
}
