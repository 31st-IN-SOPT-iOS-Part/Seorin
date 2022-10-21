//
//  ProfileViewController.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/12.
//

import UIKit

class ProfileViewController: UIViewController {
    private let profileImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        return imageView
    }()
    
    private let lineView : UIView = {
        let line = UIView()
        line.backgroundColor = .white
        return line
    }()
    private let chatButton : UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "message.fill"), for: .normal)
        button.setTitle("나와의 채팅", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize:15)
        button.alignTextBelow()
        return button
    }()
    private let editProfileButton : UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(named: "profile_editImg"), for: .normal)
        button.setTitle("프로필 편집", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize:15)
        button.alignTextBelow()
        return button
    }()
    private let kakaoStoryButton : UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(named: "profileStoryImg"), for: .normal)
        button.setTitle("카카오스토리", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize:15)
        button.alignTextBelow()
        return button
    }()
    private let backButton : UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func didTapBackButton(){
        self.dismiss(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        profileViewControllerSetLayout()
    }
}

extension ProfileViewController{
    private func profileViewControllerSetLayout(){
        [profileImageView, lineView, chatButton, editProfileButton, kakaoStoryButton, backButton].forEach {
            view.addSubview($0)
        }
        profileImageView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-202)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(97)
        }
        lineView.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(71)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(1)
        }
        editProfileButton.snp.makeConstraints { make in
            make.top.equalTo(lineView).offset(12)
            make.centerX.equalToSuperview()
            make.height.equalTo(72)
            make.width.equalTo(96)
        }
        chatButton.snp.makeConstraints { make in
            make.top.equalTo(editProfileButton)
            make.trailing.equalTo(editProfileButton.snp.leading)
            make.height.equalTo(72)
            make.width.equalTo(96)
        }
        kakaoStoryButton.snp.makeConstraints { make in
            make.top.equalTo(chatButton)
            make.leading.equalTo(editProfileButton.snp.trailing)
            make.height.equalTo(72)
            make.width.equalTo(96)
        }
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(14)
            make.leading.equalToSuperview().offset(18)
            make.width.height.equalTo(14)
        }
    }

}
