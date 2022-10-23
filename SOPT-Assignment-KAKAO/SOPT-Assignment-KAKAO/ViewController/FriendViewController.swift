//
//  HomeViewController.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/12.
//

import UIKit
import SnapKit


class FriendViewController: UIViewController {

    let friendLabel : UILabel = {
        let lable = UILabel()
        lable.font = .systemFont(ofSize: 22)
        lable.text = "친구"
        return lable
    }()
    
    let settingButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "gearshape"), for: .normal)
        button.tintColor = .black
        return button
    }()
    let profileButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "profileImage"), for: .normal)
        return button
    }()
    @objc private func didTapProfileButton(){
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileButton.addTarget(self, action: #selector(didTapProfileButton), for: .touchUpInside)
        view.backgroundColor = .white
        loginInit()
        setLayout()
    }
    
    private func loginInit(){
        let vc = LoginViewController()
        let navigationViewController = UINavigationController(rootViewController: vc)
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
}

extension FriendViewController{
    private func setLayout(){
        [friendLabel, settingButton, profileButton].forEach {
            view.addSubview($0)
        }
        friendLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(13)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(57)
            make.height.width.equalTo(21)
        }
        profileButton.snp.makeConstraints { make in
            make.top.equalTo(settingButton.snp.bottom).offset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.width.height.equalTo(59)
        }
    }
}
