//
//  SignUpViewModel.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/11/26.
//

import UIKit
import RxSwift
import RxCocoa

struct SignUpViewModel {
    
    private let disposeBag: DisposeBag = DisposeBag()
    //MARK: - Input
    public let userEmail: AnyObserver<String>
    public let userPassword: AnyObserver<String>
    public let checkUserPassword: AnyObserver<String>
    public let signUp: AnyObserver<Void>
    
    //MARK: - Output
    public let isSamePW: Observable<Bool>
    public var loginUser: Observable<LoginUser>
    
    init(){
        let fetchEmail = PublishSubject<String>()
        let fetchPassword = PublishSubject<String>()
        let fetchChechPassword = PublishSubject<String>()
        let signUpTring = PublishSubject<Void>()
        
        let checkCondition = PublishSubject<Bool>()
        let signUpUser = PublishSubject<LoginUser>()
        
        userEmail = fetchEmail.asObserver()
        userPassword = fetchPassword.asObserver()
        checkUserPassword = fetchChechPassword.asObserver()
        signUp = signUpTring.asObserver()
        
        Observable
            .combineLatest(fetchPassword, fetchChechPassword)
            .map{ $0 == $1}
            .subscribe { checkCondition.onNext($0) }
            .disposed(by: disposeBag)
        
        isSamePW = checkCondition
        
        Observable
            .combineLatest(fetchEmail, fetchPassword)
            .subscribe {
                signUpUser.onNext(LoginUser(email: $0, password: $1))
            }
            .disposed(by: disposeBag)
        
        loginUser = signUpTring.withLatestFrom(signUpUser)
    }
}
