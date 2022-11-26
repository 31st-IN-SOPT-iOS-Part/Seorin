
import UIKit
import Then
import RxSwift
import RxCocoa

final class SignUpViewController: UIViewController {
    
    private var viewModel: SignUpViewModel = SignUpViewModel()
    private let disposeBag = DisposeBag()
    
    //MARK: UIView
    private let startLabel = UILabel()
    private let emailTextField = LogintextField(frame: .zero, "이메일 또는 전화번호")
    private let passwordTextField = LogintextField(frame: .zero, "비밀번호")
    private let passwordCheckTextField = LogintextField(frame: .zero, "비밀번호 확인")
    private let signUpConfirmButton = UIButton()
    

    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDataBindingRx()
    }
}

extension SignUpViewController {
    
    //MARK: - Data Binding RXSwift
    private func setDataBindingRx() {
        emailTextField.rx.text.orEmpty
            .bind(to: viewModel.userEmail)
            .disposed(by: disposeBag)
        
        passwordTextField.rx.text.orEmpty
            .bind(to: viewModel.userPassword)
            .disposed(by: disposeBag)
        
        passwordCheckTextField.rx.text.orEmpty
            .bind(to: viewModel.checkUserPassword)
            .disposed(by: disposeBag)
        
        signUpConfirmButton.rx.tap
            .bind(to: viewModel.signUp)
            .disposed(by: disposeBag)
        
        viewModel.isSamePW
            .map { $0 ? UIColor.yellow : UIColor.systemGray4 }
            .bind(to: signUpConfirmButton.rx.backgroundColor)
            .disposed(by: disposeBag)
    }
    private func setUI(){
        view.backgroundColor = .white
        startLabel.do {
            $0.text = "카카오톡을 시작합니다"
            $0.font = .systemFont(ofSize: 20)
        }
        passwordTextField.do {
            $0.isSecureTextEntry = true
        }
        passwordCheckTextField.do {
            $0.isSecureTextEntry = true
        }
        
        signUpConfirmButton.do {
            $0.configureButton(title: "새로운 카카오계정 만들기")
            $0.addTarget(self, action: #selector(didTapSignUpConfirmButton), for: .touchUpInside)
        }
    }
    
    //MARK: - Layout Helper
    private func setLayout(){
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
    
    //MARK: Objc function
    @objc private func didTapSignUpConfirmButton(){
        let vc = LoginConfirmViewController()
        vc.modalPresentationStyle = .formSheet
        vc.setDataBindRx( LogInConfirmViewModel(loginUser: viewModel.loginUser) )
        vc.delegate = self
        present(vc, animated: true)
    }

}

extension SignUpViewController : LoginConfirmViewControllerDelegate{
    func dismissNavigationController(){
        self.navigationController?.dismiss(animated: true)
    }
}
