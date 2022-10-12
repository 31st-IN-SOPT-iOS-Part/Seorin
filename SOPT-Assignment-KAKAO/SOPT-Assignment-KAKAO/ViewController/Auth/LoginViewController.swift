//
//  FirstViewController.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
//

import UIKit

class LoginViewController: UIViewController {
//MARK: UIView
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
        textField.configureTextField(placeholder: "이메일 또는 전화번호")
        return textField
    }()
    private let passwordTextField : UITextField = {
        let textField = UITextField()
        textField.configureTextField(placeholder: "비밀번호")
        textField.isSecureTextEntry = true
        return textField
    }()
    private let loginButton : UIButton = {
        let button = UIButton()
        button.configureButton(title: "카카오계정 로그인")
        button.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
        return button
    }()
    
    private let signUpButton : UIButton = {
        let button = UIButton()
        button.configureButton(title: "새로운 카카오계정 만들기")
        return button
    }()
    private let findAccountLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오계정 또는 비밀번호 찾기"
        label.textAlignment = .center
        return label
    }()
    //MARK: Objc function
    @objc private func didTapLoginButton(){
        let vc = LoginCheckViewController()
        vc.modalPresentationStyle = .formSheet
        vc.configEmail(emailTextField.text ?? "")
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc private func didTapSignUpButton(){
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
    
    
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        [startLabel, explainLabel, emailTextField, passwordTextField, loginButton, signUpButton, findAccountLabel].forEach {
            view.addSubview($0 as! UIView)
        }
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startLabel.frame = CGRect(x: 125, y: 100, width: view.width-250, height: 30)
        explainLabel.frame = CGRect(x: 50, y: startLabel.bottom + 20, width: view.width - 100, height: 80)
        emailTextField.frame = CGRect(x: 20, y: explainLabel.bottom+50, width: view.width-40, height: 50)
        passwordTextField.frame = CGRect(x: 20, y: emailTextField.bottom+10, width: view.width-40, height: 50)
        loginButton.frame = CGRect(x: 20, y: passwordTextField.bottom+20, width: view.width-40, height: 50)
        signUpButton.frame = CGRect(x: 20, y: loginButton.bottom+10, width: view.width-40, height: 50)
        findAccountLabel.frame = CGRect(x: 10, y: signUpButton.bottom+10, width: view.width-20, height: 30)
    }
}
extension LoginViewController : LoginCheckViewControllerDelegate{
    func dismissNavigationController(){
        self.navigationController?.dismiss(animated: true)
    }
}
