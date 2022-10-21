//
//  FirstViewController.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
//

import UIKit

class SignInViewController: UIViewController {
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
        let vc = LoginConfirmViewController()
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
        setLoginViewControllerLayout()
        
        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
}
extension SignInViewController : LoginConfirmViewControllerDelegate{
    func dismissNavigationController(){
        self.navigationController?.dismiss(animated: true)
    }
}


extension SignInViewController{
    private func setLoginViewControllerLayout(){
        [startLabel, explainLabel, emailTextField, passwordTextField, loginButton, signUpButton, findAccountLabel].forEach {
            view.addSubview($0 as! UIView)
        }
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(startLabel.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(explainLabel.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(49)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(49)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(35)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(44)
        }
        signUpButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(10)
            make.leading.trailing.equalTo(loginButton)
            make.height.equalTo(44)
        }
        findAccountLabel.snp.makeConstraints { make in
            make.top.equalTo(signUpButton.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
}
