//
//  CommonFunction.swift
//  DrawerAndTabar
//
//  Created by HoangLM on 11/7/18.
//  Copyright © 2018 mobile. All rights reserved.
//

import Foundation
import UIKit

func addSimpleConstraints(child: UIView, parent: UIView, distance: CGFloat) {
    child.translatesAutoresizingMaskIntoConstraints = false
    child.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: distance).isActive = true
    child.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: -distance).isActive = true
    child.topAnchor.constraint(equalTo: parent.topAnchor, constant: distance).isActive = true
    child.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: -distance).isActive = true
}
