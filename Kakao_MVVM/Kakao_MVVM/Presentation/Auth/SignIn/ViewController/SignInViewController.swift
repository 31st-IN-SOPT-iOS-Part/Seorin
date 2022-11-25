//
//  FirstViewController.swift
//  1st_seminar_frameAndBounds
//
//  Created by Mac Book Pro on 2022/10/05.
//

import RxSwift
import RxCocoa
import Then
import UIKit

class SignInViewController: UIViewController {
    
    private var signInViewModel = SignInViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: UIView
    private let startLabel = UILabel().then{
        $0.text = "카카오톡을 시작합니다"
        $0.font = .systemFont(ofSize: 20)
    }
    
    private let explainLabel = UILabel().then{
        $0.text = "사용하던 카카오계정이 있다면 \n 이메일 또는 전화번호로 로그인해 주세요."
        $0.numberOfLines = 2
        $0.textColor = .lightGray
        $0.textAlignment = .center
    }
    private let emailTextField = LogintextField(frame: .zero, "이메일 또는 전화번호")
    
    private let passwordTextField = LogintextField(frame: .zero, "비밀번호").then{
        $0.isSecureTextEntry = true
    }
    
    private let loginButton = UIButton().then{
        $0.configureButton(title: "카카오계정 로그인")
        $0.addTarget(self, action: #selector(didTapLoginButton), for: .touchUpInside)
    }
    
    private let signUpButton = UIButton().then{
        $0.configureButton(title: "새로운 카카오계정 만들기")
    }
    
    private let findAccountLabel = UILabel().then{
        $0.text = "카카오계정 또는 비밀번호 찾기"
        $0.textAlignment = .center
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLoginViewControllerLayout()
        bindingRx()
//        signUpButton.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
    }
}
extension SignInViewController{
    private func bindingRx(){
        emailTextField.rx.text.orEmpty
            .bind(to: signInViewModel.email)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: signInViewModel.password)
            .disposed(by: disposeBag)
        
        /*
        signInViewModel.loginUser
            .map { $0.email }
            .bind(to: startLabel.rx.text)
        */
        loginButton.rx.tap
            .bind(to: signInViewModel.login)
            .disposed(by: disposeBag)
        signUpButton.rx.tap
            .bind(to: signInViewModel.signUp)
            .disposed(by: disposeBag)
        
        signInViewModel.showSignUpPage
            .subscribe {
                self.showSignUp()
            }
            .disposed(by: disposeBag)
    }
    
    
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
    //MARK: Objc function
    @objc private func didTapLoginButton(){
        let vc = LoginConfirmViewController()
        vc.modalPresentationStyle = .formSheet
        vc.viewModel = LogInConfirmViewModel(loginUser: signInViewModel.loginUser)
        vc.delegate = self
        present(vc, animated: true)
    }
    private func showSignUp(){
        print("hello")
        let vc = LoginConfirmViewController()
        vc.modalPresentationStyle = .formSheet
        vc.viewModel = LogInConfirmViewModel(loginUser: signInViewModel.loginUser)
        vc.delegate = self
        present(vc, animated: true)
    }
    
    @objc private func didTapSignUpButton(){
        self.navigationController?.pushViewController(SignUpViewController(), animated: true)
    }
}

extension SignInViewController : LoginConfirmViewControllerDelegate{
    func dismissNavigationController(){
        self.navigationController?.dismiss(animated: true)
    }
}


