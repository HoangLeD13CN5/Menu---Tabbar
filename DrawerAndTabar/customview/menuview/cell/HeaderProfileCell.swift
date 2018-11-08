//
//  HeaderProfileCell.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

class HeaderProfileCell: UITableViewCell {

    @IBOutlet weak var imageProfile: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setProperties(image:String,username:String) {
        imageProfile.layer.masksToBounds = true
        imageProfile.layer.cornerRadius = 40
        lblName.text = username
        imageProfile.image = UIImage.init(named: image)
    }
    
}
