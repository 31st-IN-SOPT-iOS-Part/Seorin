//
//  MainTabBarController.swift
//  SOPT-Assignment-KAKAO
//
//  Created by Mac Book Pro on 2022/10/23.
//

import UIKit

final class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = .black // TabBar Item 이 선택되었을때의 색
        tabBar.unselectedItemTintColor = UIColor.black // TabBar Item 의 기본
        
        setUpTabBar()
    }
    
    private func setUpTabBar() {
        tabBar.backgroundColor = .white
        tabBar.barStyle = .default
        tabBar.layer.cornerRadius = 5
        
        var firstViewController = UINavigationController(rootViewController: FriendViewController())
        var secondViewController = UINavigationController(rootViewController: ChatViewController())
        var thirdViewController = UINavigationController(rootViewController: FeedViewController())
        var fourthViewController = UINavigationController(rootViewController: ShoppingViewController())
        var fifthViewController = UINavigationController(rootViewController: MoreViewController())
        firstViewController.tabBarItem.image = UIImage(systemName: "person") // TabBar Item 의 이미지
        secondViewController.tabBarItem.image = UIImage(systemName: "message")
        thirdViewController.tabBarItem.image = UIImage(systemName: "grid")
        fourthViewController.tabBarItem.image = UIImage(systemName: "bag")
        fifthViewController.tabBarItem.image = UIImage(systemName: "ellipsis")
        
        firstViewController.tabBarItem.selectedImage = UIImage(systemName: "person.fill") // TabBar Item 의 이미지
        secondViewController.tabBarItem.selectedImage = UIImage(systemName: "message.fill") // TabBar Item 의 이미지
        thirdViewController.tabBarItem.selectedImage = UIImage(systemName: "grid") // TabBar Item 의 이미지
        fourthViewController.tabBarItem.selectedImage = UIImage(systemName: "bag.fill") // TabBar Item 의 이미지
        fifthViewController.tabBarItem.selectedImage = UIImage(systemName: "ellipsis")
        
        viewControllers = [firstViewController, secondViewController, thirdViewController, fourthViewController, fifthViewController]
        

        
    }
}

