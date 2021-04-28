//
//  CustomTopicButton.swift
//  MiniGame
//
//  Created by 신민희 on 2021/04/28.
//

import UIKit
import SnapKit

class CustomTopicButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    init(view: UIView) {
         super.init(frame: .zero)
        let width: CGFloat = 70
        let height: CGFloat = 70
        self.frame = CGRect(x: view.frame.midX - width / 2, y: view.frame.midY - height / 2, width: width, height: height)
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.systemIndigo.cgColor
        self.layer.borderWidth = 2
         }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
