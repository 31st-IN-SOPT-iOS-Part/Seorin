//
//  SignInViewModel.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import Foundation
import RxCocoa
import RxSwift

struct LoginUser{
    var email: String
    var password: String
}

struct SignInViewModel{
    let disposeBag = DisposeBag()
    
    //MARK: - INPUT
    public var email: AnyObserver<String>
    public var password: AnyObserver<String>
    public var login: AnyObserver<Void>

    //MARK: - OUTPUT
    public var loginUser: Observable<LoginUser>
    
    init() {
        let fetchEmail = PublishSubject<String>()
        let fetchPassword = PublishSubject<String>()
        let loginTrying = PublishSubject<Void>()
        let fetchLoginUser = BehaviorSubject<LoginUser>(value: LoginUser(email: "", password: ""))
        
        email = fetchEmail.asObserver()
        password = fetchPassword.asObserver()
        login = loginTrying.asObserver()

        
        let _ = Observable
            .combineLatest(fetchEmail, fetchPassword)
            .subscribe(onNext: {
                fetchLoginUser.onNext(LoginUser(email: $0, password: $1))
            })
            .disposed(by: disposeBag)
        
        loginUser = loginTrying.withLatestFrom(fetchLoginUser)
    }
}
