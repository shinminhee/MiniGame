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
    let startButton = CustomStartButton()
    var timer: Timer?
    var count = 0
    let alarm: SystemSoundID = 1005
    let timeLabel = CustomGameLabel()
    let timeTextField = UITextField()
    var timeText = ""
    let secondLabel = UILabel()
    let bombImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
}

extension BombGameViewController {
   
    @objc
    func startButton(_ sender: UIButton) {

        if timeTextField.text?.count ?? 0 >= 1 {
            count = Int(timeTextField.text ?? "0") ?? 0
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
            timeLabel.text = "\(count)"
            print(count)
            [startButton, timeLabel, timeTextField, secondLabel].forEach {
                $0.isHidden = true
            }
            bombImageView.isHidden = false
            bombImageView.animationImages = BombAnimation.getAnimationImageArray()
            bombImageView.animationDuration = 1
            bombImageView.animationRepeatCount = 0
            bombImageView.startAnimating()
        }
    }
    @objc
    func timerCount() {
        self.count -= 1
        if count <= 0 {
            AudioServicesPlaySystemSound(alarm)
            timer?.invalidate()
            timer = nil
            bombImageView.animationImages = BombAnimation.getAnimationImage()
            bombImageView.animationDuration = 1
            bombImageView.animationRepeatCount = 0
            bombImageView.startAnimating()
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
        
        timeLabel.text = "시간을 정해주세요 !"
        timeLabel.textAlignment = .center
        
        timeTextField.layer.borderWidth = 3
        timeTextField.layer.borderColor = UIColor.yellow.cgColor
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
     
        
        bombImageView.image = UIImage(named: "Bomb")
        bombImageView.isHidden = true
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
        view.addSubview(bombImageView)
        bombImageView.snp.makeConstraints {
            $0.centerX.centerY.equalTo(startButton)
            $0.width.height.equalTo(300)
        }
    }
}
