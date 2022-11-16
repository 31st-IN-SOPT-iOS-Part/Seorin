//
//  FriendTableViewCell.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/24.
//

import UIKit
import SwiftyColor

enum UserType {
    case owner
    case friend
}

final class FriendTableViewCell: UITableViewCell {
    private var userType: UserType?
    
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let nameLabel = UILabel()
    private let stateMessageLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    public func configureUser(_ user: User, userType: UserType){
        profileImageView.image = user.profileImg
        nameLabel.text = user.name
        stateMessageLabel.text = user.stateMessage
        self.userType = userType
        setFriendTableViewCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension FriendTableViewCell{
    private func setFriendTableViewCellLayout(){
        [profileImageView, nameLabel, stateMessageLabel].forEach {
            contentView.addSubview($0)
        }
        switch userType{
        case .owner: ownerLayout()
        case .friend: friendLayout()
        case .none: break
        }
    }
    private func ownerLayout(){
        nameLabel.font = .systemFont(ofSize: 16)
        stateMessageLabel.font = .systemFont(ofSize: 11)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(7)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(58)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(11)
            make.top.equalToSuperview().offset(19)
        }
        stateMessageLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(6)
        }
    }
    private func friendLayout(){
        nameLabel.font = .systemFont(ofSize: 12)
        stateMessageLabel.font = .systemFont(ofSize: 11)
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(44)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(11)
            make.top.equalToSuperview().offset(10)
        }
        stateMessageLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
        }

    }
}
