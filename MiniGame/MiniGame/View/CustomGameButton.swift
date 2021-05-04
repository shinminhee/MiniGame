//
//  CustomGameButton.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/04.
//

import UIKit
import SnapKit

class CustomGameButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.systemIndigo.cgColor
        self.layer.borderWidth = 2
    }

    init(view: UIView) {
         super.init(frame: .zero)
//        let width: CGFloat = 160
//        let height: CGFloat = 100
//        self.frame = CGRect(x: view.frame.midX - width / 2, y: view.frame.midY - height / 2, width: width, height: height)
       
         }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
