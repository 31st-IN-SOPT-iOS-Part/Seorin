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
        let vc = LoginCheckViewController()
        vc.modalPresentationStyle = .formSheet
        vc.configEmail(emailTextField.text ?? "")
        present(vc, animated: true)
        self.navigationController?.popViewController(animated: false)
    }

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(startLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(passwordCheckTextField)
        view.addSubview(signUpConfirmButton)
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        startLabel.frame = CGRect(x: 125, y: 100, width: view.width-250, height: 30)
        emailTextField.frame = CGRect(x: 20, y: startLabel.bottom + 100, width: view.width-40, height: 50)
        passwordTextField.frame = CGRect(x: 20, y: emailTextField.bottom + 10, width: view.width-40, height: 50)
        passwordCheckTextField.frame = CGRect(x: 20, y: passwordTextField.bottom + 10, width: view.width-40, height: 50)
        signUpConfirmButton.frame = CGRect(x: 20, y: passwordCheckTextField.bottom + 20, width: view.width-40, height: 50)
    }
}
