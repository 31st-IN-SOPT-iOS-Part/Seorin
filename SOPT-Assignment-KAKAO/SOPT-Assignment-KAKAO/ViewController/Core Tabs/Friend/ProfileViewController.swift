//
//  ProfileViewController.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/12.
//

import UIKit
import SnapKit
import Then

final class ProfileViewController: UIViewController {
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    private let profileNameLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 18)
    }
    
    private let lineView = UIView().then{
        $0.backgroundColor = .white
    }
    private let chatButton = ProfileButton(frame: .zero, profileButtonType: .chatButton)
    private let editProfileButton = ProfileButton(frame: .zero, profileButtonType: .editButton)
    private let kakaoStoryButton = ProfileButton(frame: .zero, profileButtonType: .kakaoStoryButton)
    
    private let backButton = UIButton().then{
        $0.tintColor = .white
        $0.setImage(UIImage(systemName: "xmark"), for: .normal)
        $0.addTarget(self, action: #selector(didTapBackButton), for: .touchUpInside)
    }
    
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
    public func setProfile(user: User, userType: UserType){
        profileImageView.image = user.profileImg
        profileNameLabel.text = user.name
        if(userType == .owner){
            chatButton.setTitle("나와의 채팅", for: .normal)
            chatButton.alignTextBelow()
        }else{
            chatButton.setTitle("1:1 채팅", for: .normal)
            chatButton.alignTextBelow()
        }
    }
    
    private func profileViewControllerSetLayout(){
        [profileImageView, profileNameLabel, lineView, chatButton, editProfileButton, kakaoStoryButton, backButton].forEach {
            view.addSubview($0)
        }
        profileImageView.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-202)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(97)
        }
        
        profileNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(profileImageView)
            make.top.equalTo(profileImageView.snp.bottom).offset(8)
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
