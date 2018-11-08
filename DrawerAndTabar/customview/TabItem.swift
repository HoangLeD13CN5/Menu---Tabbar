//
//  TabItem.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class TabItem: UIView {
    
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    func changeUI(textName:String,textColor:UIColor,image:String){
        text.text = textName
        text.textColor = textColor
        icon.image = UIImage(named: image)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initXib()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initXib()
    }
    
    func initXib(){
        let view = loadNib()
        addSubview(view)
        addSimpleConstraints(child: view, parent: self, distance: 0)
    }
    
}
