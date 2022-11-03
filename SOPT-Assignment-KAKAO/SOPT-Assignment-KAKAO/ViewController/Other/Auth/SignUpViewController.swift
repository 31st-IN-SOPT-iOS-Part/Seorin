//
//  SignUpViewController.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
//

import UIKit
import Then

final class SignUpViewController: UIViewController {
    //MARK: UIView
    private let startLabel = UILabel().then{
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 20)
    }
    private let emailTextField = LogintextField(frame: .zero, "이메일 또는 전화번호")
    
    private let passwordTextField = LogintextField(frame: .zero, "비밀번호").then{
        $0.isSecureTextEntry = true
    }
    private let passwordCheckTextField = LogintextField(frame: .zero, "비밀번호 확인").then{
        $0.isSecureTextEntry = true
    }
    
    private let signUpConfirmButton = UIButton().then{
        $0.configureButton(title: "새로운 카카오계정 만들기")
        $0.addTarget(self, action: #selector(didTapSignUpConfirmButton), for: .touchUpInside)
    }
    
    
    
    //MARK: Objc function
    @objc private func didTapSignUpConfirmButton(){
        let vc = LoginCheckViewController()
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

extension SignUpViewController : LoginCheckViewControllerDelegate{
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
