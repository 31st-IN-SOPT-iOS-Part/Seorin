//
//  ChatViewController.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/23.
//

import UIKit
import Then
import SwiftyColor

enum ChattingViewCase{
    case chatting
    case openChatting
}

final class ChatViewController: UIViewController {
    private let chattingButton = UIButton().then{
        $0.setTitle("채팅", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize:22, weight: .bold)
        $0.setTitleColor( .black, for: .normal)
    }
    private let openChattingButton = UIButton().then{
        $0.setTitle("오픈채팅", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize:22, weight: .bold)
        $0.setTitleColor(0xA6A6A6.color, for: .normal)
    }
    
    private let plusButton = UIButton().then{
        $0.setImage(Image.plusButtonImage, for: .normal)
        $0.tintColor = .black
    }
    
    private let settingButton = UIButton().then{
        $0.setImage(Image.settingButtonImage, for: .normal)
        $0.tintColor = .black
    }
    
    private let scrollView = UIScrollView().then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
    }
    private let chattingView = ChattingView()

    private let openChattingView = OpenChattingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        chatViewControllerButtonConfigure()
        
    }
}

extension ChatViewController{
    private func chatViewControllerButtonConfigure(){
        chattingButton.addTarget(self, action: #selector(didTapChattingButton), for: .touchUpInside)
        openChattingButton.addTarget(self, action: #selector(didTapOpenChattingButton), for: .touchUpInside)
        plusButton.addTarget(self, action: #selector(didTapPlusButton), for: .touchUpInside)
    }
    @objc private func didTapChattingButton(){
        chattingButton.setTitleColor(.black, for: .normal)
        openChattingButton.setTitleColor(.gray, for: .normal)
        //Scroll Viwe 좌표 바꾸기
    }
    @objc private func didTapOpenChattingButton(){
        chattingButton.setTitleColor(.gray, for: .normal)
        openChattingButton.setTitleColor(.black, for: .normal)
        //Scroll Viwe 좌표 바꾸기
    }
    @objc private func didTapPlusButton(){
        let vc = PhotoViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    //MARK: - Layout Helper
    private func setLayout(){
        view.backgroundColor = .white
        [chattingButton, openChattingButton, plusButton, settingButton].forEach {
            view.addSubview($0)
        }
        chattingButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(15)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(14)
        }
        openChattingButton.snp.makeConstraints { make in
            make.top.equalTo(chattingButton)
            make.leading.equalTo(chattingButton.snp.trailing).offset(7)
        }
        
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(17)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-15)
            make.height.width.equalTo(19)
        }
        plusButton.snp.makeConstraints { make in
            make.top.equalTo(settingButton)
            make.trailing.equalTo(settingButton.snp.leading).offset(-12)
            make.height.width.equalTo(19)
        }
        
        view.addSubview(scrollView)
        [chattingView, openChattingView].forEach {
            scrollView.addSubview($0)
        }
        scrollView.backgroundColor  = .cyan
        
        scrollView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.top.equalTo(plusButton.snp.bottom).offset(16)
        }
        
        
        chattingView.snp.makeConstraints { make in
            //스크롤 시작 부분만 superView fkd
            make.leading.top.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.width.equalTo(view.width)
        }
        
        openChattingView.snp.makeConstraints { make in
            make.leading.equalTo(chattingView.snp.trailing)
            make.height.width.top.equalTo(chattingView)
            
            make.trailing.equalToSuperview()
        }
    }
}
