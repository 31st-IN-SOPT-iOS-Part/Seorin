//
//  ChattingTableViewHeaderView.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import UIKit

final class ChattingTableViewHeaderView: UITableViewHeaderFooterView {
    static let identifier = "ChattingTableViewHeaderView"
    
    private let bannerImageView = UIImageView().then {
        $0.image = Image.chattingBannerImg
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 6
        $0.clipsToBounds = true
    }
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        ChattingTableViewHeaderViewSetLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ChattingTableViewHeaderView{
    private func ChattingTableViewHeaderViewSetLayout(){
        self.addSubview(bannerImageView)
        bannerImageView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
    }
}

