//
//  LogInConfirmViewModel.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/11/25.
//

import UIKit
import RxSwift

struct LogInConfirmViewModel {

    let disposeBag = DisposeBag()
    
    //MARK: - Input
//    public var userName: AnyObserver<String>
//    public var userName: String
    
    
    //MARK: - Output
    public let welcomeString: Observable<String>
    public var loginUser: Observable<LoginUser>
    
    init(loginUser: Observable<LoginUser>) {
        
        let getUserName = PublishSubject<String>()
        let welcomUser = PublishSubject<String>()
        
        self.loginUser = loginUser
        
        getUserName
            .subscribe { userName in
                welcomUser.onNext("\(userName)님 환영합니다!")
            }
        
        welcomeString = welcomUser
    }
}

