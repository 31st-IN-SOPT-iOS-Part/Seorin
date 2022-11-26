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
    
    //MARK: - Output
    public let welcomeString: Observable<String>
    public var loginUser: Observable<LoginUser>
    
    init(loginUser: Observable<LoginUser>) {
        let welcomUser = PublishSubject<String>()
        self.loginUser = loginUser
        
        loginUser
            .map{"\($0.email)님\n 환영합니다"}
            .subscribe(onNext: {
                welcomUser.onNext($0)
            })
            .disposed(by: disposeBag)
        
        welcomeString = welcomUser
    }
}

