//
//  SignUpViewController.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
//

import UIKit

class SignUpViewController: UIViewController {
    //MARK: UIView
    private let startLabel : UILabel = {
        let label = UILabel()
        label.text = "카카오톡을 시작합니다"
        label.font = .systemFont(ofSize: 20)
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
        return textField
    }()
    private let passwordCheckTextField : UITextField = {
        let textField = UITextField()
        textField.configureTextField(placeholder: "비밀번호 확인")
        return textField
    }()
    
    
    
    private let signUpConfirmButton : UIButton = {
        let button = UIButton()
        button.configureButton(title: "새로운 카카오계정 만들기")
        button.addTarget(self, action: #selector(didTapSignUpConfirmButton), for: .touchUpInside)
        return button
    }()
    
    
    
    //MARK: Objc function
    @objc private func didTapSignUpConfirmButton(){
        let vc = LoginConfirmViewController()
        vc.modalPresentationStyle = .formSheet
        vc.configEmail(emailTextField.text ?? "")
        vc.delegate = self
        present(vc, animated: true)
    }

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setSignUpViewControllerLayout()
    }
    
}

extension SignUpViewController : LoginConfirmViewControllerDelegate{
    func dismissNavigationController(){
        self.navigationController?.dismiss(animated: true)
    }
}

extension SignUpViewController{
    private func setSignUpViewControllerLayout(){
        [startLabel, emailTextField, passwordTextField, passwordCheckTextField, signUpConfirmButton].forEach {
            view.addSubview($0)
        }
        startLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.centerX.equalToSuperview()
        }
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(startLabel.snp.bottom).offset(116)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(49)
        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(49)
        }
        passwordCheckTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(10)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(49)
        }
        signUpConfirmButton.snp.makeConstraints { make in
            make.top.equalTo(passwordCheckTextField.snp.bottom).offset(26)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(44)
        }
    }

}
