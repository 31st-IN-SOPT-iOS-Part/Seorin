import UIKit

class LoginCheckViewController: UIViewController {
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
        button.backgroundColor = .yellow
        return button
    }()
    //MARK: Objc function
    @objc private func didTapConfirmButton(){
        self.dismiss(animated: true)
    }
    
    //MARK: viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(confirmBtn)
        confirmBtn.addTarget(self, action: #selector(didTapConfirmButton), for: .touchUpInside)
    }
    public func configEmail(_ email : String){
        welcomeLabel.text = "\(email)님\n 환영합니다"
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        welcomeLabel.frame = CGRect(x: 150, y: 250, width: view.width - 300, height: 100)
        confirmBtn.frame = CGRect(x: 20, y: 550, width: view.width-40, height: 50)
    }
    
    
    
}
