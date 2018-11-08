//
//  HeaderView.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class HeaderView: UIView {
    @IBOutlet weak var lblTitle: UILabel!
    weak var delegate: HeaderViewDelegate?
    
    @IBAction func clickMenu(_ sender: Any) {
        delegate?.didTapBtnMenu()
    }
    
    @IBAction func clickSetting(_ sender: Any) {
        delegate?.didTapBtnSetting()
    }
    
    func changeTitle(title:String){
        lblTitle.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initXib()
    }
    
    private func initXib(){
        let view = loadNib()
        addSubview(view)
        addSimpleConstraints(child: view, parent: self, distance: 0)
    }
    
}

protocol HeaderViewDelegate: class {
    func didTapBtnMenu()
    func didTapBtnSetting()
}
