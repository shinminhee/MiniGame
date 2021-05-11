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
    let startButton = CustomStartButton()
    var timer: Timer?
    var count = 0
    let alarm: SystemSoundID = 1005
    let timeLabel = CustomGameLabel()
    let timeTextField = UITextField()
    var timeText = ""
    let secondLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setBasic()
    }
}

extension BombGameViewController {
    @objc
    func startButton(_ sender: UIButton) {
        count = Int(timeTextField.text ?? "0") ?? 0
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
        timeLabel.text = "\(count)"
        print(count)
    }
    @objc
    func timerCount() {
        self.count -= 1
        if count <= 0 {
            AudioServicesPlaySystemSound(alarm)
            timer?.invalidate()
            timer = nil
        }
    }
}

extension BombGameViewController {
    func setBasic() {
//        setTimer()
//        setLayout()
//        setStartButton()
        setTimeLabel()
    }
    func setTimeLabel() {
        [timeLabel, timeTextField, secondLabel, startButton].forEach {
            view.addSubview($0)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(view).inset(100)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(100)
        }
        timeTextField.snp.makeConstraints {
            $0.leading.equalTo(view).inset(100)
            $0.top.equalTo(timeLabel.snp.bottom).inset(-40)
            $0.width.height.equalTo(100)
        }
        secondLabel.snp.makeConstraints {
            $0.leading.equalTo(timeTextField.snp.trailing)
            $0.top.height.equalTo(timeTextField)
            $0.trailing.equalTo(view).inset(30)
            $0.width.equalTo(view.frame.width / 2)
        }
        startButton.snp.makeConstraints {
            $0.top.equalTo(timeTextField.snp.bottom).offset(40)
            $0.leading.trailing.equalTo(view).inset(40)
            $0.height.equalTo(50)
        }
        
        let text = "시간을 정해주세요 !"
        let attributedStr = NSMutableAttributedString(string: text)
        attributedStr.addAttribute(.strokeWidth, value: 6.0, range: (text as NSString).range(of: "시간을 정해주세요 !"))
        timeLabel.attributedText = attributedStr
        timeLabel.textAlignment = .center
        
        timeTextField.layer.borderWidth = 3
        timeTextField.layer.borderColor = UIColor.lightGray.cgColor
        timeTextField.font = UIFont.systemFont(ofSize: 40)
        timeTextField.layer.cornerRadius = 10
        timeTextField.textAlignment = .center
        timeTextField.textColor = .white
        timeTextField.keyboardType = .numberPad
        
        secondLabel.backgroundColor = .black
        secondLabel.text = "초"
        secondLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        secondLabel.textColor = .white
        secondLabel.textAlignment = .center
        
        startButton.layer.borderColor = UIColor.red.cgColor
        startButton.setTitle("게임시작", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
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

}
