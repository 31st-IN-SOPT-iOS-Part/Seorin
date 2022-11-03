//
//  PhotoViewController.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/11/02.
//

import UIKit
import Then
import SnapKit
import SwiftyColor

class PhotoViewController: UIViewController {
    struct SelectedPhoto{
        var photoIndex: Int
        var selectionIndex: Int
    }
    
    private let images = Image.photoImage
    private var selectedImageNum: Int = 0
    private var selectedPhotos: [SelectedPhoto] = []
    
    private let closeButton = UIButton().then {
        $0.setImage(Image.closeButtonImage, for: .normal)
        $0.tintColor = .black
    }
    private let recentPhotoLabel = UILabel().then {
        $0.text = "최근 항목"
        $0.font = .systemFont(ofSize: 16)
    }
    private let sendButton = UIButton().then {
        $0.setTitle("전송", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
    }
    private lazy var photoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 123 , height: 123)
        // Item spacing
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 3

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
        setButtonConfig()
        setImage()
    }
}
extension PhotoViewController{
    private func setImage(){
        for index in 0..<31{
            selectedPhotos.append(SelectedPhoto(photoIndex: 0, selectionIndex: 0))
        }
        selectedImageNum = 0
        
    }
    //MARK: - Layout Helper
    private func setLayout(){
        view.backgroundColor = .white
        [closeButton, recentPhotoLabel, sendButton, photoCollectionView].forEach {
            view.addSubview($0)
        }
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(11)
            make.leading.equalTo(view.safeAreaLayoutGuide).offset(12)
            make.width.height.equalTo(24)
        }
        recentPhotoLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(11)
        }
        sendButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-10)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(11)
        }
        photoCollectionView.snp.makeConstraints { make in
            make.top.equalTo(recentPhotoLabel.snp.bottom).offset(11)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    private func setButtonConfig(){
        closeButton.addTarget(self, action: #selector(didTapCloseButton), for: .touchUpInside)
    }
    @objc private func didTapCloseButton(){
        self.dismiss(animated: true)
    }
}

extension PhotoViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = photoCollectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }
        
        if(indexPath.row == 0){
            cell.setCellImage(Image.selectPhotoImage!
                .withAlignmentRectInsets(UIEdgeInsets(top: -46, left: -46, bottom: -46, right: -46)))
        }else{
            cell.setCellImage(images[indexPath.row-1] ?? Image.defaultPhotoImage!)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        photoCollectionView.deselectItem(at: indexPath, animated: true)
        let cell = photoCollectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
        if(indexPath.row != 0){
            if(cell.isCellSelected){
                var selectedIndex: Int = 0
                //선택된 사진의 selectionIndex 값 찾기
                for index in (0..<selectedPhotos.count){
//                (0..<selectedPhotos.count).forEach { index in
                    if(selectedPhotos[index].photoIndex == indexPath.row){
                        selectedIndex = selectedPhotos[index].selectionIndex
                        selectedPhotos[index].selectionIndex = 0
                        selectedPhotos[index].photoIndex = 0
                        (index..<30).forEach {
                            selectedPhotos[$0].selectionIndex = selectedPhotos[$0+1].selectionIndex
                            selectedPhotos[$0].photoIndex = selectedPhotos[$0+1].photoIndex
                        }
                        break
                    }
                }
                
                cell.deselectCell(indexPath.row)
                selectedImageNum -= 1
                (0..<images.count).forEach { photoIndex in
                    if(selectedPhotos[photoIndex].selectionIndex > selectedIndex){
                        selectedPhotos[photoIndex].selectionIndex -= 1
                        //selectedPhotos[photoIndex].photoIndex
                        let cell = photoCollectionView.cellForItem(at: IndexPath.init(row: selectedPhotos[photoIndex].photoIndex, section: 0) ) as! PhotoCollectionViewCell
                        cell.selecteCell(selectedPhotos[photoIndex].selectionIndex)
                    }
                }
            }else{
                selectedPhotos[selectedImageNum].photoIndex = indexPath.row
                selectedPhotos[selectedImageNum].selectionIndex = selectedImageNum+1
                selectedImageNum += 1
                cell.selecteCell(selectedImageNum)
            }
        }
    }
}
