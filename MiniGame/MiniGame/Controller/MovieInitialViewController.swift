//
//  MovieInitialViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/03.
//

import UIKit

class MovieInitialViewController: UIViewController {
    
    let mainLogo = UIImageView()
    let qAndALabel = UILabel()
    var qAndAText = ""
    let personView = UIView()
    let personLabel = UILabel()
    var gameInt = 0
    var gameNum = 0
    let upButton = UIButton()
    let downButton = UIButton()
    let startButton = CustomStartButton()
    let nextButton = CustomStartButton()
    var unSelected = ""
    let qaTitle = ["문제", "정답"]
    let answerButton = CustomStartButton()
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }

}

extension MovieInitialViewController {
    @objc
    func startButton(_ sender: UIButton) {
        gameNum = gameInt
        if gameNum > 0 {
        startButton.isHidden = true
        nextButton.isHidden = false
        answerButton.isHidden = false
        qAndAText = MovieAlphabet.shared.qAndA["\(qaTitle[0])"]?.randomElement() ?? ""
        print(qAndAText)
        personView.isHidden = true
        qAndALabel.text = qAndAText
        }
    }
    @objc
    func answerButton(_ sender: UIButton) {
        answerButton.isHidden = true
        let selected =  MovieAlphabet.shared.dicQAndA["\(qAndAText)"] ?? ""
        unSelected = selected
        qAndALabel.text = "\(unSelected)"
    }

    @objc
    func nextButton(_ sender: UIButton) {
        answerButton.isHidden = false
        qAndAText = MovieAlphabet.shared.qAndA["\(qaTitle[0])"]?.randomElement() ?? ""
        qAndALabel.text = qAndAText
        if gameNum != 1 {
            gameNum -= 1
            personView.isHidden = true
        } else {
            personView.isHidden = false
            startButton.isHidden = false
        }
    }
    @objc
    func upButton(_ sender: UIButton) {
        if gameInt <= 9 {
            gameInt += 1
        }
        personLabel.text = "국내영화: \(gameInt)편 "
    }
    @objc
    func downButton(_ sender: UIButton) {
        if gameInt >= 2 {
            gameInt -= 1
        } else {
            gameInt = 0
        }
        personLabel.text = "국내영화: \(gameInt)편"
    }
}

extension MovieInitialViewController {
    final private func setUI() {
        setQAndALabel()
        setPersonView()
        setNextButton()
    }

    final private func setNextButton() {
        [nextButton, answerButton, startButton].forEach {
            view.addSubview($0)
        }
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(40)
            $0.bottom.equalTo(view.snp.bottom).inset(200)
            $0.height.equalTo(50)
        }
        answerButton.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(nextButton)
        }
        startButton.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(nextButton)
        }
        nextButton.addTarget(self, action: #selector(nextButton(_:)), for: .touchUpInside)
        nextButton.setTitle("다음문제", for: .normal)
        nextButton.layer.borderColor = UIColor.yellow.cgColor
        nextButton.isHidden = true
        
        answerButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)
        answerButton.setTitle("정답확인", for: .normal)
        answerButton.layer.borderColor = UIColor.green.cgColor
        answerButton.isHidden = true
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.layer.borderColor = UIColor.red.cgColor
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        mainLogo.image = UIImage(named: "MovieInitial")

    }
    final private func setPersonView() {
        view.addSubview(mainLogo)
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(10)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(240)
        }
        view.addSubview(personView)
        [personLabel, upButton, downButton].forEach {
            personView.addSubview($0)
        }
        personView.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalTo(qAndALabel)
        }
        personLabel.snp.makeConstraints {
            $0.leading.top.equalTo(personView).inset(20)
            $0.height.equalTo(30)
            $0.width.equalTo(160)
        }
        upButton.snp.makeConstraints {
            $0.leading.equalTo(personLabel.snp.trailing)
            $0.top.equalTo(personLabel)
            $0.trailing.equalTo(personView).inset(20)
            $0.height.equalTo(15)
        }
        downButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(upButton)
            $0.top.equalTo(upButton.snp.bottom)
            $0.height.equalTo(15)
        }
        
        personView.backgroundColor = .yellow
        personLabel.backgroundColor = .red
        personLabel.text = "국내영화: \(gameInt)편"
        
        upButton.backgroundColor = .purple
        upButton.addTarget(self, action: #selector(upButton(_:)), for: .touchUpInside)
        downButton.backgroundColor = .systemPink
        downButton.addTarget(self, action: #selector(downButton(_:)), for: .touchUpInside)
        
    }
    final private func setQAndALabel() {
        view.addSubview(qAndALabel)
        qAndALabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(240)
            $0.height.equalTo(160)
        }
        qAndALabel.backgroundColor = .purple
        qAndALabel.textAlignment = .center
    }
}
