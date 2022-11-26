//
//  NSObject +.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/11/17.
//

import Foundation

extension NSObject {
     static var className: String {
         NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
     }
     var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
 }
