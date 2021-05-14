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
        animationArray.append(UIImage(named: "Bomb11")!)
        animationArray.append(UIImage(named: "Bomb12")!)
        animationArray.append(UIImage(named: "Bomb13")!)
        animationArray.append(UIImage(named: "Bomb14")!)
        animationArray.append(UIImage(named: "Bomb15")!)
        animationArray.append(UIImage(named: "Bomb16")!)
        animationArray.append(UIImage(named: "Bomb17")!)
        animationArray.append(UIImage(named: "Bomb18")!)
        animationArray.append(UIImage(named: "Bomb19")!)
        animationArray.append(UIImage(named: "Bomb20")!)
        animationArray.append(UIImage(named: "Bomb21")!)
        animationArray.append(UIImage(named: "Bomb22")!)
        animationArray.append(UIImage(named: "Bomb23")!)
        animationArray.append(UIImage(named: "Bomb24")!)
        animationArray.append(UIImage(named: "Bomb25")!)
        animationArray.append(UIImage(named: "Bomb26")!)
        animationArray.append(UIImage(named: "Bomb27")!)
        animationArray.append(UIImage(named: "Bomb28")!)
        animationArray.append(UIImage(named: "Bomb29")!)
        animationArray.append(UIImage(named: "Bomb30")!)
        return animationArray
    }
    class func getAnimationImage() -> [UIImage] {
        var animationArray: [UIImage] = []
        animationArray.append(UIImage(named: "FinishBomb")!)
        return animationArray
    }
}


