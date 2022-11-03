//
//  ChattingTableViewCell.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/25.
//

import UIKit

final class ChattingTableViewCell: UITableViewCell {
    private let profileImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
    }
    private let messageLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 11)
    }
    private let timeLabel = UILabel().then {
        $0.textColor = 0xA6A6A6.color
        $0.font = .systemFont(ofSize: 8)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        chattingTableViewCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ChattingTableViewCell{
    public func chattingRoomconfigure(chatting : Chatting){
        profileImageView.image = chatting.user.profileImg
        nameLabel.text = chatting.user.name
        messageLabel.text = chatting.lastMessage
        timeLabel.text = chatting.lastMessageTime
    }
    private func chattingTableViewCellLayout(){
        [profileImageView, nameLabel, messageLabel, timeLabel].forEach {
            contentView.addSubview($0)
        }
        profileImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(16)
            make.width.height.equalTo(44)
        }
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(11)
            make.top.equalToSuperview().offset(10)
        }
        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
        }
        timeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-16)
        }
    }
}
