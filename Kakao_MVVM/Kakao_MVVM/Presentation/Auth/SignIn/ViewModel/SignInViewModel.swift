//
//  SignInViewModel.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import Foundation
import RxSwift

struct SignInViewModel{
    var name : Observable<String>
    
    func login(name: String) -> Observable<String> {
            return Observable.create({ (observer) -> Disposable in

                print("\(observer)") // 요기다가 비지니스 로직 (네트워크를 타고 온 것들)
                
                observer.onNext(name)
                
                return Disposables.create()

            })
        }
}
