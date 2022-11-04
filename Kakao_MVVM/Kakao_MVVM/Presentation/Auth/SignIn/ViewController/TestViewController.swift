//
//  TestViewController.swift
//  Kakao_MVVM
//
//  Created by Mac Book Pro on 2022/10/27.
//

import UIKit
import RxSwift

class TestViewController: UIViewController {
    let viewModel: SignInViewModel
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBindings()
    }
    
    init(viewModel: SignInViewModel = SignInViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        viewModel = SignInViewModel()
        super.init(coder: aDecoder)
    }
    
    func setupBindings() {
    }
}
