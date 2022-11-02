//
//  LoginTextField.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import Foundation
import Then
import UIKit
import SnapKit

final class LogintextField : UITextField{
    let underLineView = UIView().then{
        $0.backgroundColor = .systemGray4
    }
                          
    init(frame : CGRect,_ placeholderText : String) {
        super.init(frame: frame)
        configureTextField(placeholder: placeholderText)
        addLeftPadding()
        drawBottomLine()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func drawBottomLine(){
        self.addSubview(underLineView)
        underLineView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
    }
    private func addLeftPadding() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    private func configureTextField(placeholder : String){
        self.placeholder = placeholder
        self.clearButtonMode = .whileEditing
    }

    
}

