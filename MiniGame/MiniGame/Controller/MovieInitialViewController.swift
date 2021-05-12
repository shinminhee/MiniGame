//
//  MovieInitialViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/03.
//

import UIKit

class MovieInitialViewController: UIViewController {
    
    let mainLogo = UIImageView()
    let qAndALabel = CustomGameLabel()
    var qAndAText = ""
    let movieView = UIView()
    let movieLabel = CustomGameLabel()
    var gameInt = 0
    var gameNum = 0
    let upButton = UIButton()
    let downButton = UIButton()
    let startButton = CustomStartButton()
    let nextButton = CustomStartButton()
    let answerButton = CustomStartButton()
    var unSelected = ""
    let qaTitle = ["문제", "정답"]
    

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
            movieView.isHidden = true
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
            movieView.isHidden = true
        } else {
            movieView.isHidden = false
            startButton.isHidden = false
        }
    }
    @objc
    func upButton(_ sender: UIButton) {
        if gameInt <= 9 {
            gameInt += 1
        }
        movieLabel.text = "국내영화: \(gameInt)편 "
    }
    @objc
    func downButton(_ sender: UIButton) {
        if gameInt >= 2 {
            gameInt -= 1
        } else {
            gameInt = 0
        }
        movieLabel.text = "국내영화: \(gameInt)편"
    }
}

extension MovieInitialViewController {
    final private func setUI() {
        setQAndALabel()
        setMovieView()
        setButton()
        setLayout()
    }
    final private func setLayout() {
        view.addSubview(mainLogo)
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(10)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(240)
        }
        view.addSubview(qAndALabel)
        qAndALabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(mainLogo.snp.bottom).offset(20)
            $0.width.equalTo(240)
            $0.height.equalTo(160)
        }
        view.addSubview(movieView)
        [movieLabel, upButton, downButton].forEach {
            movieView.addSubview($0)
        }
        movieView.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalTo(qAndALabel)
        }
        movieLabel.snp.makeConstraints {
            $0.leading.equalTo(movieView).inset(20)
            $0.centerY.equalTo(movieView)
            $0.height.equalTo(70)
            $0.width.equalTo(160)
        }
        upButton.snp.makeConstraints {
            $0.trailing.equalTo(movieView).inset(15)
            $0.top.equalTo(movieLabel)
            $0.height.width.equalTo(40)
            
        }
        downButton.snp.makeConstraints {
            $0.trailing.equalTo(movieView).inset(15)
            $0.bottom.equalTo(movieLabel)
            $0.height.width.equalTo(40)
        }
        [nextButton, answerButton, startButton].forEach {
            view.addSubview($0)
        }
        nextButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(40)
            $0.top.equalTo(movieView.snp.bottom).offset(50)
            $0.height.equalTo(50)
        }
        answerButton.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(nextButton)
        }
        startButton.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(nextButton)
        }
    }
    final private func setButton() {
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
    final private func setMovieView() {
        movieView.backgroundColor = .black
        movieView.layer.borderColor = UIColor.yellow.cgColor
        movieView.layer.cornerRadius = 10
        movieView.layer.borderWidth = 3
        
        movieLabel.text = "국내영화: \(gameInt)편"
        movieLabel.textAlignment = .center
        movieLabel.layer.borderColor = UIColor.blue.cgColor
        movieLabel.layer.cornerRadius = 10
  
        upButton.addTarget(self, action: #selector(upButton(_:)), for: .touchUpInside)
        upButton.setImage(UIImage(named: "upButton"), for: .normal)        
        downButton.addTarget(self, action: #selector(downButton(_:)), for: .touchUpInside)
        downButton.setImage(UIImage(named: "downButton"), for: .normal)
    }
    final private func setQAndALabel() {
        qAndALabel.layer.borderColor = UIColor.systemPink.cgColor
        qAndALabel.font = UIFont.systemFont(ofSize: 20)
        qAndALabel.textAlignment = .center
        qAndALabel.layer.cornerRadius = 10
    }
}
