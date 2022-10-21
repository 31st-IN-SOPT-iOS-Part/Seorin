import UIKit


protocol LoginConfirmViewControllerDelegate : AnyObject{
    func dismissNavigationController()
}

class LoginConfirmViewController: UIViewController {
    //MARK: UIView
    private let welcomeLabel : UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    private let confirmBtn : UIButton = {
        let button = UIButton()
        button.configureButton(title: "확인")
        button.backgroundColor = .systemYellow
        return button
    }()
    //MARK: Objc function
    @objc private func didTapConfirmButton(){
        self.dismiss(animated: true)
        print("hello")
        print(delegate.self)
        delegate?.dismissNavigationController()
    }
    
    public weak var delegate : LoginConfirmViewControllerDelegate?
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setLoginCheckViewControllerLayout()
        confirmBtn.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }

    public func configEmail(_ email : String){
        welcomeLabel.text = "\(email)님\n 환영합니다"
    }
}


extension LoginConfirmViewController{
    private func setLoginCheckViewControllerLayout(){
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
}
