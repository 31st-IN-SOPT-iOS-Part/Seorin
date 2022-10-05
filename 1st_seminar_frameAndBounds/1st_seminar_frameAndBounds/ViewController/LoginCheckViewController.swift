//
//  LoginCheckViewController.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
//

import UIKit

class LoginCheckViewController: UIViewController {
    
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private let confirmBtn : UIButton = {
        let button = UIButton()
        button.setTitle("확인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        return button
    }()
    
    @objc private func didTapConfirmButton(){
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(confirmBtn)
        confirmBtn.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }
    public func configEmail(_ email : String){
        welcomeLabel.text = "\(email)님\n 환영합니다"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        welcomeLabel.frame = CGRect(x: 150, y: 250, width: view.width - 300, height: 100)
        confirmBtn.frame = CGRect(x: 20, y: 550, width: view.width-40, height: 50)
    }
}
