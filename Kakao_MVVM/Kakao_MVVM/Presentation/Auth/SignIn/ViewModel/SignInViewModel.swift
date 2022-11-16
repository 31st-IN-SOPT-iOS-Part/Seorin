//
//  SignInViewModel.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import Foundation
import RxCocoa
import RxSwift

struct SignInViewModel{
    let disposeBag = DisposeBag()
    
    //MARK: - INPUT
    let userLogin: AnyObserver<String>
    
    //MARK: - OUTPUT
    let loginedUser: Observable<Bool>
    
    init(loginModel: LoginModel = LoginModel()) {
        let login = PublishSubject<String>()
        userLogin = login.asObserver()

    }
}


struct LoginModel{
    func loginUser (email: String)-> Observable<User> {
        return Observable.create { observer in
            observer.onNext(User(name: email))
            return Disposables.create()
        }
    }
}

/*
struct SignInViewModel{
    var name : Observable<String>
    var loginUser: PublishSubject<User?> = PublishSubject<User?>()
    var loginBtnTouched: PublishRelay<Void> = PublishRelay<Void>()

    var idValue: PublishRelay<String?> = PublishRelay<String?>()
    var pwValue: PublishRelay<String?> = PublishRelay<String?>()

    //  loginInfo   는  Observable     !!!!!        ->  위 값들을 합친!!!!!
    var loginInfo:Observable<String> {
        // subject 들의 값을 합칠 수 있음!
        return Observable.combineLatest(idValue, pwValue) { id, pw in
            return id ?? ""
        }
    }


    let disposeBag = DisposeBag()



// 우선 여기까지
    init(model:Login = Login()) {
        loginBtnTouched.withLatestFrom(loginInfo).flatMapLatest{
            return model.login(email: $0).materialize()
            }.subscribe(onNext: { [unowned self] (event) in
                switch event {
                case .next(let user):
                    self.loginUser.onNext(user)
                case .error(let error):
                    self.loginUser.onNext(nil)
                case .completed:
                    print("COMPLTED")
                }
            }).disposed(by: disposeBag)
    }

}

struct Login{
    func login(email: String) -> Observable<String> {
        return Observable.create({ (observer) -> Disposable in

            print("\(observer)") // 요기다가 비지니스 로직 (네트워크를 타고 온 것들)

            observer.onNext(email)

            return Disposables.create()

        })
    }
}
// 로직 전용 Model 에서 하는 코드
/*
func login(name: String) -> Observable<String> {
    return Observable.create({ (observer) -> Disposable in

        print("\(observer)") // 요기다가 비지니스 로직 (네트워크를 타고 온 것들)

        observer.onNext(name)

        return Disposables.create()

    })
}
 */
*/
