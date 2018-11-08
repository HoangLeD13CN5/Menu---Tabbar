//
//  MenuViewCellTableViewCell.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit
enum MenuType {
    case Profile
    case Logout
}
class MenuViewCellTableViewCell: UITableViewCell {
    @IBOutlet weak var imgIcon: UIImageView!
    
    @IBOutlet weak var lblTitle: UILabel!
    
    var type:MenuType = MenuType.Profile
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        switch type {
        case .Profile:
            didTapSelected(textString:"Profile",textColor: UIColor.blue, icon: "icAccountTap")
            return
        case .Logout:
            didTapSelected(textString:"Logout",textColor: UIColor.black, icon: "icLogout")
            return
        }
    }
    
    func setNormal(type:MenuType){
        self.type = type
        switch type {
        case .Profile:
            didTapSelected(textString:"Profile",textColor: UIColor.black, icon: "icAccountNormal")
            return
        case .Logout:
            didTapSelected(textString:"Logout",textColor: UIColor.black, icon: "icLogout")
            return
        }
    }
    
    func didTapSelected(textString:String,textColor:UIColor,icon:String){
        lblTitle.text = textString
        lblTitle.textColor = textColor
        imgIcon.image = UIImage.init(named: icon)
    }
    
}
