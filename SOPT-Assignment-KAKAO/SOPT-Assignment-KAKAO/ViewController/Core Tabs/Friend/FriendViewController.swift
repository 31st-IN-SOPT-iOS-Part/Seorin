//
//  HomeViewController.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/12.
//

import UIKit
import SnapKit
import Then

final class FriendViewController: UIViewController {
    var ownerUser = User(name: "유서린", stateMessage: "상태메세지는 여기에")
    var users: [User] = [
        User(name: "안솝트", profileImg: Image.profileImg[0]!, stateMessage: "언제 볼건데?"),
        User(name: "최솝트", profileImg: Image.profileImg[1]!, stateMessage: "피곤해요"),
        User(name: "정솝트", profileImg: Image.profileImg[2]!, stateMessage: "살려줘요"),
        User(name: "강솝트", profileImg: Image.profileImg[3]!, stateMessage: "살려줘요"),
        User(name: "오솝트", profileImg: Image.profileImg[4]!, stateMessage: "살려줘요"),
        User(name: "황솝트", profileImg: Image.profileImg[5]!, stateMessage: "살려줘요"),
        User(name: "최솝트", profileImg: Image.profileImg[6]!, stateMessage: "살려줘요"),
        User(name: "고솝트", profileImg: Image.profileImg[7]!, stateMessage: "살려줘요"),
        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요"),
        User(name: "허솝트", profileImg: Image.profileImg[8]!, stateMessage: "살려줘요")
    ] {
        didSet {
            friendsTableView.reloadData()
        }
    }
    
    private let friendLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.text = "친구"
    }
    private let settingButton = UIButton().then{
        $0.setImage(Image.settingButtonImage, for: .normal)
        $0.tintColor = .black
    }
    private lazy var friendsTableView = UITableView().then{
        $0.register(FriendTableViewCell.self)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.separatorStyle = .none
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addConfigure()
        loginInit()
        setLayout()
    }
}

extension FriendViewController{
    private func loginInit(){
        let vc = LoginViewController()
        let navigationViewController = UINavigationController(rootViewController: vc)
        navigationViewController.modalPresentationStyle = .fullScreen
        present(navigationViewController, animated: true)
    }
    
    private func addConfigure(){
        friendsTableView.delegate = self
        friendsTableView.dataSource = self
    }
    
    private func setLayout(){
        view.backgroundColor = .white
        [friendLabel, settingButton, friendsTableView].forEach {
            view.addSubview($0)
        }
        friendLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(17)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            make.height.width.equalTo(19)
        }
        friendsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(68)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension FriendViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count+1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = friendsTableView.dequeueReusableCell(withIdentifier: FriendTableViewCell.identifier, for: indexPath) as? FriendTableViewCell else { return UITableViewCell() }
        if(indexPath.row == 0){
            cell.configureUser(ownerUser, userType: .owner)
        }else{
            cell.configureUser(users[indexPath.row-1], userType: .friend)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        indexPath.row == 0 ? 73 : 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .fullScreen
        if(indexPath.row == 0){
            vc.setProfile(user: ownerUser, userType: .owner)
        }else{
            vc.setProfile(user: users[indexPath.row-1], userType: .friend)
        }
        self.present(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if (indexPath.row==0){ return UISwipeActionsConfiguration()}
        
        let favoriteActions = UIContextualAction(style: .normal, title: "", handler: { action, view, completionHandler in
            completionHandler(true)
        })
        favoriteActions.backgroundColor = .systemBlue
        favoriteActions.image = UIImage(systemName: "star")
        return UISwipeActionsConfiguration(actions: [favoriteActions])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if (indexPath.row==0){ return UISwipeActionsConfiguration()}
        
        let hideAction = UIContextualAction(style: .normal, title: "숨김") { action, view, completionHandler in
            for index in (indexPath.row-1..<self.users.count-1){
                self.users[index] = self.users[index+1]
            }
            self.users.removeLast()
            tableView.reloadData()
            completionHandler(true)
        }
        
        hideAction.backgroundColor = .systemGray
        let deleteAction = UIContextualAction(style: .destructive, title: "삭제") { action, view, completionHandler in
            for index in (indexPath.row-1..<self.users.count-1){
                self.users[index] = self.users[index+1]
            }
            self.users.removeLast()
            tableView.reloadData()
            completionHandler(true)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, hideAction])
    }
}
