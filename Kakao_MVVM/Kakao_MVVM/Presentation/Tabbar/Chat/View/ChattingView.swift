//
//  ChattingView.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import UIKit

class ChattingView: UIView {
    var users: [User] = [
        User(name: "안솝트", profileImg: Image.profileImg[0]!, stateMessage: "언제 볼건데?"),
        User(name: "최솝트", profileImg: Image.profileImg[1]!, stateMessage: "피곤해요"),
        User(name: "정솝트", profileImg: Image.profileImg[2]!, stateMessage: "살려줘요"),
        User(name: "강솝트", profileImg: Image.profileImg[3]!, stateMessage: "살려줘요"),
        User(name: "오솝트", profileImg: Image.profileImg[4]!, stateMessage: "살려줘요"),
        User(name: "황솝트", profileImg: Image.profileImg[5]!, stateMessage: "살려줘요"),
        User(name: "최솝트", profileImg: Image.profileImg[6]!, stateMessage: "살려줘요"),
        User(name: "고솝트", profileImg: Image.profileImg[7]!, stateMessage: "살려줘요"),
        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요")
    ]
    var chattings: [Chatting]{ [
        Chatting(user: self.users[0], lastMessage: self.users[0].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[1], lastMessage: self.users[1].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[2], lastMessage: self.users[2].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[3], lastMessage: self.users[3].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[4], lastMessage: self.users[4].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[5], lastMessage: self.users[5].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[6], lastMessage: self.users[6].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[7], lastMessage: self.users[7].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[8], lastMessage: self.users[8].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[8], lastMessage: self.users[8].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[8], lastMessage: self.users[8].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[8], lastMessage: self.users[8].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[8], lastMessage: self.users[8].stateMessage, lastMessageTime: "오후 9:41"),
        Chatting(user: self.users[8], lastMessage: self.users[8].stateMessage, lastMessageTime: "오후 9:41"),
    ]}
    
    
    private lazy var chattingTableView = UITableView(frame: .zero, style: .grouped).then {
        $0.register(ChattingTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: ChattingTableViewHeaderView.identifier)
//        $0.register(ChattingTableViewCell.self)
        ChattingTableViewCell.register(target: $0)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ChattingView{
    private func addConfigure(){
        chattingTableView.delegate = self
        chattingTableView.dataSource = self
        
        addSubview(chattingTableView)
        chattingTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}


extension ChattingView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        chattings.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = chattingTableView.dequeueReusableCell(withIdentifier: ChattingTableViewCell.className, for: indexPath) as? ChattingTableViewCell else { return UITableViewCell() }
        cell.chattingRoomconfigure(chatting: chattings[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    //MARK: - TableView Header
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let chattingTableViewHeaderView = chattingTableView.dequeueReusableHeaderFooterView(withIdentifier: ChattingTableViewHeaderView.identifier) as? ChattingTableViewHeaderView else { return UIView() }
        return chattingTableViewHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 71
    }
}


