//
//  BombGameViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/04.
//

import UIKit
import AVFoundation

class BombGameViewController: UIViewController {
    
    var bombLabel = UILabel()
    let startButton = UIButton()
    var timer: Timer?
    var count = 3
    let alarm: SystemSoundID = 1005

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setBasic()
    }
}

extension BombGameViewController {
    @objc
    func startButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
    }
    @objc
    func timerCount() {
        self.count -= 1
        bombLabel.text = "\(count)"
        if count <= 0 {
            AudioServicesPlaySystemSound(alarm)
            timer?.invalidate()
            timer = nil

        }
    }
    
}

extension BombGameViewController {
    func setBasic() {
        setTimer()
        setLayout()
        setStartButton()
    }

    func setTimer() {
        startButton.backgroundColor = .gray
        bombLabel.backgroundColor = .blue
    }
    func setLayout() {
        view.addSubview(bombLabel)
        bombLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.width.equalTo(100)
        }
        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            $0.top.equalTo(bombLabel.snp.bottom)
            $0.leading.equalTo(bombLabel.snp.leading)
            $0.height.width.equalTo(100)
        }
    }
    func setStartButton() {
        startButton.backgroundColor = .gray
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        bombLabel.backgroundColor = .blue
    }

}
