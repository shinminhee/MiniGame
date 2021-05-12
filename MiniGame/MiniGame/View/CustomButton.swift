//
//  CustomButton.swift
//  MiniGame
//
//  Created by 신민희 on 2021/04/30.
//

import UIKit

class CustomUpButton: UIButton {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 100)) // 시작점을 (0, 3)으로 이동한다.
        path.addLine(to: CGPoint(x: 50, y: 0)) // (0, 30)에서 (100, 3)으로 이동한다.
        path.addLine(to: CGPoint(x: 100, y: 100)) // (100, 3)에서 (120, 100)으로 이동한다.
        path.close() // (120, 100)에서 시작점을 자동으로 연결한다.
        path.lineWidth = 3 // 선의 굵기를 3으로 지정한다.
//        self.layer.borderWidth = 1
//        self.backgroundColor = .black

        UIColor.green.set()
        path.stroke() // 검은색으로 바탕을 채운다.

        UIColor.yellow.set()
        path.fill() // 빨간색으로 채운다.
    }
}

class CustomDownButton: UIButton {
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0)) // 시작점을 (0, 3)으로 이동한다.
        path.addLine(to: CGPoint(x: 100, y: 0)) // (0, 30)에서 (100, 3)으로 이동한다.
        path.addLine(to: CGPoint(x: 50, y: 100)) // (100, 3)에서 (120, 100)으로 이동한다.
        path.close() // (120, 100)에서 시작점을 자동으로 연결한다.
        path.lineWidth = 3 // 선의 굵기를 3으로 지정한다.
//        path.layer.borderWidth = 1
//        path.backgroundColor = .black
//
        UIColor.blue.set()
        path.stroke() // 검은색으로 바탕을 채운다.

        UIColor.red.set()
        path.fill() // 빨간색으로 채운다.
    }
}

class CustomStartButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.clipsToBounds = true
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 3
        self.layer.shadowColor = UIColor.white.cgColor // 색깔
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.3
        self.backgroundColor = .black
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.setTitleColor(.white, for: .normal)
    }

    init(view: UIView) {
         super.init(frame: .zero)

         }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomCloseButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)     
        self.backgroundColor = .clear
        self.setImage(UIImage(systemName: "xmark")?.withTintColor(.systemGray, renderingMode: .alwaysOriginal), for: .normal)
    }

    init(view: UIView) {
         super.init(frame: .zero)

         }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
