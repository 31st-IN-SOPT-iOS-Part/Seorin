import UIKit
import RxSwift
import RxCocoa

protocol LoginConfirmViewControllerDelegate : AnyObject{
    func dismissNavigationController()
}

class LoginConfirmViewController: UIViewController {
    
    public weak var delegate : LoginConfirmViewControllerDelegate?
    
    private let disposeBag = DisposeBag()
    private var viewModel: LogInConfirmViewModel?
    
    //MARK: UIView
    private let welcomeLabel: UILabel = UILabel()
    private let confirmBtn: UIButton = UIButton()
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
}
extension LoginConfirmViewController{
    
    public func setDataBindRx(_ viewModel: LogInConfirmViewModel) {    
        self.viewModel = viewModel
        self.viewModel?.welcomeString
            .bind(to: welcomeLabel.rx.text)
            .disposed(by: disposeBag)
    }
    
    private func setUI(){
        view.backgroundColor = .white
        welcomeLabel.do {
            $0.numberOfLines = 2
            $0.textAlignment = .center
            $0.font = .systemFont(ofSize: 20)
        }
        confirmBtn.do {
            $0.configureButton(title: "확인")
            $0.backgroundColor = .systemYellow
        }
    }
    private func setLayout(){
        confirmBtn.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
        view.addSubview(welcomeLabel)
        view.addSubview(confirmBtn)
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(197)
            make.centerX.equalToSuperview()
        }
        confirmBtn.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).offset(117)
            make.leading.trailing.equalToSuperview().inset(21)
            make.height.equalTo(44)
        }
    }
    //MARK: Objc function
    @objc private func didTapConfirmButton(){
        self.dismiss(animated: true)
        delegate?.dismissNavigationController()
    }
}
