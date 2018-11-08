//
//  MenuView.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import UIKit

class MenuView: UIView {

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: MenuViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initXib()
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initXib()
        initUI()
    }
    
    func initXib(){
        let view = loadNib()
        addSubview(view)
        addSimpleConstraints(child: view, parent: self, distance: 0)
    }
    
    func initUI(){
        self.registerCell()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        self.tableView.separatorColor = UIColor.clear
    }
}

extension MenuView: UITableViewDelegate, UITableViewDataSource {
    func registerCell() {
        tableView.register(UINib(nibName: "MenuViewCellTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuViewCellTableViewCell")
        tableView.register(UINib(nibName: "HeaderProfileCell", bundle: nil), forCellReuseIdentifier: "HeaderProfileCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderProfileCell", for: indexPath) as! HeaderProfileCell
                cell.setProperties(image: "imgProfile", username: "Ravi K. Naum")
                cell.layer.backgroundColor = UIColor(red:0.00, green:0.36, blue:0.77, alpha:1.0).cgColor
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuViewCellTableViewCell", for: indexPath) as! MenuViewCellTableViewCell
                cell.setNormal(type: .Profile)
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuViewCellTableViewCell", for: indexPath) as! MenuViewCellTableViewCell
                cell.setNormal(type: .Logout)
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            delegate?.didTapMenu(type: MenuType.Profile)
            break
        case 2:
            delegate?.didTapMenu(type: MenuType.Logout)
            break
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 240
        default:
            return 44
        }
    }
}

protocol MenuViewDelegate: class {
    func didTapMenu(type:MenuType)
}
