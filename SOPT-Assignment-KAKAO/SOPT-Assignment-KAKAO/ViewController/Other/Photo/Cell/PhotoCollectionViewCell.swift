//
//  PhotoCollectionViewCell.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/11/02.
//

import UIKit
import Then
import SnapKit


enum PhotoSelected{
    case seleted
    case deselected
}
final class PhotoCollectionViewCell: UICollectionViewCell {
    public var isCellSelected: Bool = false
    
    private let background = UIView().then{
        $0.backgroundColor = 0xD9D9D9.color
    }
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .black
    }
    private let indexLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10)
        $0.layer.cornerRadius = 9
        $0.clipsToBounds = true
        $0.textAlignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PhotoCollectionViewCell{
    private func setLayout(){
        [background, imageView, indexLabel].forEach {
            contentView.addSubview($0)
        }
        background.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(4)
        }
        imageView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview().inset(4)
        }
        indexLabel.snp.makeConstraints { make in
            make.width.height.equalTo(18)
            make.trailing.top.equalToSuperview().inset(8)
        }
    }
    public func setCellImage(_ image : UIImage){
        self.imageView.image = image
    }
    
    public func selecteCell(_ index: Int){
        self.isCellSelected = true
        indexLabel.backgroundColor = .systemYellow
        indexLabel.text = String(index)
        contentView.layer.borderWidth = 4
        self.contentView.layer.borderColor = UIColor.systemYellow.cgColor
    }
    
    public func deselectCell(_ index: Int){
        self.isCellSelected = false
        indexLabel.backgroundColor = .clear
        indexLabel.text = ""
        contentView.layer.borderWidth = 4
        self.contentView.layer.borderColor = UIColor.clear.cgColor
    }
}
