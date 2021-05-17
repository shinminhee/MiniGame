//
//  BombAnimation.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/13.
//

import UIKit

class BombAnimation {
    static let sharedInstance = BombAnimation()
    
    class func getAnimationImageArray() -> [UIImage] {
        var animationArray: [UIImage] = []
        let imageName = "Bomb"
        for i in 1...30 {
            animationArray.append(UIImage(named: imageName + "\(i)")!)
        }
        return animationArray
    }
    class func getAnimationImage() -> [UIImage] {
        var animationArray: [UIImage] = []
        animationArray.append(UIImage(named: "FinishBomb")!)
        return animationArray
    }
}


