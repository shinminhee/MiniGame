//
//  CustomGameLabel.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/07.
//

import UIKit
import SnapKit

class CustomGameLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius = 50
        self.layer.borderWidth = 3
        self.layer.shadowColor = UIColor.white.cgColor // 색깔
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 5
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.textColor = UIColor.white
        self.backgroundColor = .black

    }

    init(view: UIView) {
         super.init(frame: .zero)

         }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
