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
    public var signUp: AnyObserver<Void>

    //MARK: - OUTPUT
    public var loginUser: Observable<LoginUser>
    public var showSignUpPage: Observable<Void>
    
    init() {
        let fetchEmail = PublishSubject<String>()
        let fetchPassword = PublishSubject<String>()
        let fetchLoginUser = BehaviorSubject<LoginUser>(value: LoginUser(email: "", password: ""))
        let loginTrying = PublishSubject<Void>()
        let signUpTrying = PublishSubject<Void>()
        
        email = fetchEmail.asObserver()
        password = fetchPassword.asObserver()
        login = loginTrying.asObserver()
        signUp = signUpTrying.asObserver()
        
        Observable
            .combineLatest(fetchEmail, fetchPassword)
            .subscribe(onNext: {
                fetchLoginUser.onNext(LoginUser(email: $0, password: $1))
            })
            .disposed(by: disposeBag)
        
        loginUser = loginTrying.withLatestFrom(fetchLoginUser)
            .map{ $0 }
        
        
        showSignUpPage = signUpTrying
//        loginUser = fetchLoginUser
    }
}
