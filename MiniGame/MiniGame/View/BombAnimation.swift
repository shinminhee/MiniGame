//
//  BombAnimation.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/13.
//

import UIKit

class BombAnimation {
    private static let sharedInstance = BombAnimation()

    class func show() {
        let backgroundView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        
        let popupView = UIImageView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
        popupView.animationImages = BombAnimation.getAnimationImageArray()
        popupView.animationDuration = 3
        popupView.animationRepeatCount = 0
        
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(backgroundView)
            window.addSubview(popupView)
            
            backgroundView.frame = CGRect(x: 0, y: 0, width: window.frame.maxX, height: window.frame.maxY)
            backgroundView.backgroundColor = .white
            
            popupView.center = window.center
            popupView.startAnimating()
        }
    }

    private class func getAnimationImageArray() -> [UIImage] {
        var animationArray: [UIImage] = []
        animationArray.append(UIImage(named: "Bomb")!)
        animationArray.append(UIImage(named: "Bomb1")!)
        animationArray.append(UIImage(named: "Bomb2")!)
        animationArray.append(UIImage(named: "Bomb3")!)
        animationArray.append(UIImage(named: "Bomb4")!)
        animationArray.append(UIImage(named: "Bomb5")!)
        animationArray.append(UIImage(named: "Bomb6")!)
        animationArray.append(UIImage(named: "Bomb7")!)
        animationArray.append(UIImage(named: "Bomb8")!)
        animationArray.append(UIImage(named: "Bomb9")!)
        animationArray.append(UIImage(named: "Bomb10")!)
        return animationArray
    }
}


