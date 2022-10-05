//
//  FirstViewController.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
//

import UIKit

class LoginViewController: UIViewController {
    private let startLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private let explainLabel : UILabel = {
        let label = UILabel()
        label.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        label.numberOfLines = 2
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    private let emailTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "이메일 또는 전화번호"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        return textField
    }()
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray6
        return textField
    }()
    private let loginButton : UIButton = {
        let button = UIButton()
        button.setTitle("카카오계정 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.setTitle("새로운 카카오계정 만들기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        return button
    }()
    private let findAccountLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.textAlignment = .center
        return label
    }()
    @objc private func didTapLoginButton(){
        let vc = LoginCheckViewController()
        vc.modalPresentationStyle = .formSheet
        vc.configEmail(emailTextField.text ?? "")
        present(vc, animated: true)
    }
    @objc private func didTapSignUpButton(){
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let component: [Any] = [startLabel, explainLabel, emailTextField, passwordTextField, loginButton, signUpButton, findAccountLabel]
        component.forEach {
            view.addSubview($0 as! UIView)
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startLabel.frame = CGRect(x: 100, y: 100, width: view.width-200, height: 30)
        explainLabel.frame = CGRect(x: 50, y: startLabel.bottom + 20, width: view.width - 100, height: 80)
        emailTextField.frame = CGRect(x: 20, y: explainLabel.bottom+50, width: view.width-40, height: 50)
        passwordTextField.frame = CGRect(x: 20, y: emailTextField.bottom+10, width: view.width-40, height: 50)
        loginButton.frame = CGRect(x: 20, y: passwordTextField.bottom+20, width: view.width-40, height: 50)
        signUpButton.frame = CGRect(x: 20, y: loginButton.bottom+10, width: view.width-40, height: 50)
        findAccountLabel.frame = CGRect(x: 10, y: signUpButton.bottom+10, width: view.width-20, height: 30)
        
    }
}
