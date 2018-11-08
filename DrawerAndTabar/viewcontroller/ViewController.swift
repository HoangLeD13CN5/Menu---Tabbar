//
//  ViewController.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - UI Properties
    @IBOutlet weak var tabbar: Tabbar!
    @IBOutlet weak var headerView: HeaderView!
    @IBOutlet weak var containerView: UIView!
    private var mainMenu:MenuView!
    private var mainBackground:UIView!
    private var childViewController:UIViewController!
    
     //MARK: - Properties
    var isShowMainMenu = false
   
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        headerView.delegate = self
        tabbar.delegate = self
       
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.hideMenu))
        mainBackground = UIView(frame: view.bounds)
        mainBackground.isHidden = true
        mainBackground.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        mainBackground.isUserInteractionEnabled = true
        mainBackground.addGestureRecognizer(gesture)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.hideMenu))
        swipeRight.direction = .right
        mainBackground.addGestureRecognizer(swipeRight)
        
        view.addSubview(mainBackground)
        
        mainMenu = MenuView(frame: CGRect.init(x: -250, y: 0, width: 250, height: self.view.frame.height))
        mainMenu.delegate = self
        view.addSubview(mainMenu)
        
        openMessageVC()
    }
    
    //MARK: - Action Handle
    private func showMenu() {
        isShowMainMenu = true
       
        UIView.animate(withDuration: 0.25,
                       delay: 0,
                       options: .curveEaseOut,
                       animations: {
                self.mainMenu.frame.origin = CGPoint.init(x: 0, y: 0)
                self.mainBackground.isHidden = false
         }, completion: nil)
       
    }
    
    @objc func hideMenu(){
        if(isShowMainMenu){
            isShowMainMenu = false
            
            UIView.animate(withDuration: 0.25,
                           delay: 0,
                           options: .curveEaseOut,
                           animations: {
                            self.mainMenu.frame.origin = CGPoint(x: -250, y: 0)
                            self.mainBackground.isHidden = true
            }, completion: nil)
        }
    }
    
    //MARK: - Router
    private func setChildViewController(storybroadName: String,identifier: String){
        // remove child in view controller
        if let child = childViewController {
            child.willMove(toParent: self)
            child.view.removeFromSuperview()
            child.removeFromParent()
        }
        // set up and add child viewcontroller to viewcontroller
        let storybroad = UIStoryboard(name: storybroadName, bundle: Bundle.main)
        childViewController = storybroad.instantiateViewController(withIdentifier: identifier)
        childViewController.view.frame = containerView.bounds
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.didMove(toParent: self)
    }
    
    
    private func openProfileViewController(){
        
    }
    
    private func logoutAccount(){
        
    }
    
    private func openMessageVC() {
        self.setChildViewController(storybroadName: "Main", identifier: "MessageController")
    }
    
    private func openNotificationVC(){
        self.setChildViewController(storybroadName: "Main", identifier: "NotificationViewController")
    }
    
    private func openSettingVC() {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingViewController")
        self.present(vc, animated: true, completion: nil)
    }
}

//MARK: - Implemention HeaderViewDelegate
extension ViewController: HeaderViewDelegate{
    func didTapBtnMenu() {
        if(!isShowMainMenu){
            showMenu()
        }
    }
    
    func didTapBtnSetting() {
        self.openSettingVC()
    }
}

//MARK: - Implemention TabbarDelegate
extension ViewController:TabbarDelegate{
    func didTapMessage() {
        self.openMessageVC()
    }
    
    func didTapNotification() {
        self.openNotificationVC()
    }
}

//MARK: - Implemention MenuViewDelegate
extension ViewController:MenuViewDelegate {
    func didTapMenu(type:MenuType) {
        switch type {
        case .Profile:
            self.openProfileViewController()
            break
        default:
            self.logoutAccount()
            break
        }
    }
}

