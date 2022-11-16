////
////  FriendViewModel.swift
////  Kakao_MVVM
////
////  Created by Mac Book Pro on 2022/10/27.
////
//
//import Foundation
//import RxSwift
//import RxCocoa
//
//class FriendViewModel{
//    var users: [User] = [
//        User(name: "안솝트", profileImg: Image.profileImg[0]!, stateMessage: "언제 볼건데?"),
//        User(name: "최솝트", profileImg: Image.profileImg[1]!, stateMessage: "피곤해요"),
//        User(name: "정솝트", profileImg: Image.profileImg[2]!, stateMessage: "살려줘요"),
//        User(name: "강솝트", profileImg: Image.profileImg[3]!, stateMessage: "살려줘요"),
//        User(name: "오솝트", profileImg: Image.profileImg[4]!, stateMessage: "살려줘요"),
//        User(name: "황솝트", profileImg: Image.profileImg[5]!, stateMessage: "살려줘요"),
//        User(name: "최솝트", profileImg: Image.profileImg[6]!, stateMessage: "살려줘요"),
//        User(name: "고솝트", profileImg: Image.profileImg[7]!, stateMessage: "살려줘요"),
//        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
//        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
//        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
//        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
//        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
//        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
//        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요")
//    ]
//    
//    private lazy var subject = BehaviorSubject<[User]>(value: self.users)
//    
//    let disposeBag = DisposeBag()
//    
////    var test : Observable<User>
//    
//    
//    init(){
//        
//    }
//    
//    @discardableResult
//    func testFunc()->Observable<[User]>{
//        users = [User(name: "안솝트", profileImg: Image.profileImg[0]!, stateMessage: "언제 볼건데?")]
//        subject.onNext(users)
////        subject.onNext(",,,,,🧎‍♂️🧎‍♂️🧎‍♂️")
//    }
//}
