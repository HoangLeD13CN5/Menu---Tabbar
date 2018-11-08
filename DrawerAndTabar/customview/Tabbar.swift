//
//  Tabbar.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

enum ItemType {
    case Message
    case Notification
}

@IBDesignable class Tabbar: UIView {
    //MARK - Property
    weak var delegate:TabbarDelegate?
    
    // MARK - UI Property
    @IBOutlet weak var tabMessage: TabItem!
    
    @IBOutlet weak var tabNotification: TabItem!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initXib()
    }
    
    func initXib(){
        let view = loadNib()
        addSubview(view)
        addSimpleConstraints(child: view, parent: self, distance: 0)
        tabItemSelected(type:ItemType.Message)
        tabItemNormal(type:ItemType.Notification)
    }
    
    // MARK - Action
    @IBAction func didTapBtnNotification(_ sender: Any) {
        tabItemSelected(type:ItemType.Notification)
        tabItemNormal(type:ItemType.Message)
        self.delegate?.didTapNotification()
    }
    
    @IBAction func didTapBtnMessage(_ sender: Any) {
        tabItemSelected(type:ItemType.Message)
        tabItemNormal(type:ItemType.Notification)
        self.delegate?.didTapMessage()
    }
    
    // MARK - Private Method
    private func tabItemSelected(type:ItemType){
        switch type {
        case .Message:
            tabMessage.changeUI(textName:"Chat",textColor: UIColor.blue, image: "TabMessageOn")
            return
        case .Notification:
            tabNotification.changeUI(textName:"Notification",textColor: UIColor.red, image: "TabNoticeOn")
            return
        }
    }
    
    private func tabItemNormal(type:ItemType){
        switch type {
        case .Message:
            tabMessage.changeUI(textName:"Chat",textColor: UIColor.black, image: "TabMessageOff")
            return
        case .Notification:
            tabNotification.changeUI(textName:"Notification",textColor: UIColor.black, image: "TabNoticeOff")
            return
        }
    }
}
// MARK - Deleagte
protocol TabbarDelegate: class {
    func didTapMessage()
    func didTapNotification()
}
