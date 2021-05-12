//
//  BombGameViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/04.
//

import UIKit
import AVFoundation

class BombGameViewController: UIViewController {
    
    let mainLogo = UIImageView()
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
        setUI()
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
    func setUI() {
        setLayout()
        setBasic()
    }
    func setBasic() {
        mainLogo.image = UIImage(named: "BombGame")

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
    
    func setLayout() {
        view.addSubview(mainLogo)
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(10)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(240)
        }
        [timeLabel, timeTextField, secondLabel, startButton].forEach {
            view.addSubview($0)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogo.snp.bottom).inset(10)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(70)
        }
        timeTextField.snp.makeConstraints {
            $0.leading.equalTo(view).inset(100)
            $0.top.equalTo(timeLabel.snp.bottom)
            $0.width.height.equalTo(100)
        }
        secondLabel.snp.makeConstraints {
            $0.leading.equalTo(timeTextField.snp.trailing)
            $0.bottom.equalTo(timeTextField)
            $0.width.height.equalTo(80)
        }
        startButton.snp.makeConstraints {
            $0.top.equalTo(timeTextField.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(view).inset(40)
            $0.height.equalTo(50)
        }
    }
}
