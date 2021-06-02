//
//  SpeedQuizViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/06/02.
//

import UIKit

class SpeedQuizViewController: UIViewController {

    let mainLogo = UIImageView()
    let proverbLabel = CustomGameLabel()
    let startButton = CustomStartButton()
    let nextButton = CustomStartButton()
    let paperLabel = UILabel()
    var gameInt = 0
    var gameNum = 0
    let upButton = UIButton()
    let downButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}


extension SpeedQuizViewController {
    @objc
    func startButton(_ sender: UIButton) {
        let arraynum: Int = KoreanProverb.shared.proverb.count // 메시지 배열의 요소 개수를 세서 arraynum 변수에 할당
        let firstNumbers = Int.random(in: 0 ..< arraynum) // 랜덤으로 수를 골라 numbers 변수에 할당
        let firstMessage = KoreanProverb.shared.proverb[firstNumbers]
        proverbLabel.text = "\(firstMessage)"
        paperLabel.isHidden = false
        nextButton.isHidden = false
        self.paperLabel.backgroundColor = .white
        self.paperLabel.text = "종이를 넘겨주세요"
    }
    @objc
    func nextButton(_ sender: UIButton) {
        let arraynum: Int = KoreanProverb.shared.proverb.count // 메시지 배열의 요소 개수를 세서 arraynum 변수에 할당
        let firstNumbers = Int.random(in: 0 ..< arraynum) // 랜덤으로 수를 골라 numbers 변수에 할당
        let firstMessage = KoreanProverb.shared.proverb[firstNumbers]
        proverbLabel.text = "\(firstMessage)"
        self.paperLabel.backgroundColor = .white
        self.paperLabel.text = "종이를 넘겨주세요"
        paperLabel.isHidden = false
    }
    
    @objc
    func paperLabelTaped(_ sender: UITapGestureRecognizer) {
        UIView.transition(with: self.paperLabel, duration: 1, options: .transitionCurlUp, animations: {
            self.paperLabel.backgroundColor = .clear
            self.paperLabel.text = ""
        }, completion: nil)
    }
}

extension SpeedQuizViewController {
    final private func setUI() {
        setBasics()
        setLayouts()
    }
    
    final private func setBasics() {
        
        mainLogo.image = UIImage(named: "KoreanQuiz")
        proverbLabel.layer.borderColor = UIColor.yellow.cgColor
        proverbLabel.textAlignment = .center
        proverbLabel.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        proverbLabel.layer.cornerRadius = 0
        proverbLabel.numberOfLines = 3
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        startButton.layer.borderColor = UIColor.green.cgColor
        
        paperLabel.textColor = .black
        paperLabel.textAlignment = .center
        paperLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        paperLabel.isHidden = true
        let paperLabelTaped = UITapGestureRecognizer(target: self, action: #selector(paperLabelTaped(_:)))
        paperLabelTaped.numberOfTouchesRequired = 1
        paperLabelTaped.numberOfTapsRequired = 1
        paperLabel.addGestureRecognizer(paperLabelTaped)
        paperLabel.isUserInteractionEnabled = true
        
        nextButton.setTitle("다음문제", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButton(_:)), for: .touchUpInside)
        nextButton.layer.borderColor = UIColor.systemPink.cgColor
        nextButton.isHidden = true
    }
    
    final private func setLayouts() {
        view.addSubview(mainLogo)
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(10)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(240)
        }
        view.addSubview(proverbLabel)
        proverbLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogo.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(300)
        }
        view.addSubview(paperLabel)
        paperLabel.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(proverbLabel).inset(5)
        }
        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(40)
            $0.height.equalTo(50)
            $0.top.equalTo(proverbLabel.snp.bottom).offset(30)
        }
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalTo(startButton)
        }
    }
    
}

