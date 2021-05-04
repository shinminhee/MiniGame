//
//  MiniGameViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/04.
//

import UIKit
import SnapKit

class MiniGameViewController: UIViewController {
    
    let liarGameButton = CustomGameButton()
    let koreanGameButton = CustomGameButton()
    let movieInitialGameButton = CustomGameButton()
    let bombGameButton = CustomGameButton()
    let mainLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
    }
}

extension MiniGameViewController {
    @objc
    func liarGame(_ sender: UIButton){
        print(#function)
        let liarVC = LiarGameViewController()
        present(liarVC, animated: true, completion: nil)
    }
    @objc
    func koreanGame(_ sender: UIButton){
        let koreanVC = KoreanQuizViewController()
        present(koreanVC, animated: true, completion: nil)
    }
    @objc
    func movieInitialGame(_ sender: UIButton){
        let movieInitialVC = MovieInitialViewController()
        present(movieInitialVC, animated: true, completion: nil)
    }
    @objc
    func bombGame(_ sender: UIButton){
        let bombVC = BombGameViewController()
        present(bombVC, animated: true, completion: nil)
    }
}

extension MiniGameViewController {
    final private func setUI() {
        setMainLogo()
        setLiarGame()
        setKoreanGame()
        setMovieInitial()
        setBombGame()
    }
    final private func setMainLogo() {
        view.addSubview(mainLabel)
        mainLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(40)
            $0.leading.trailing.equalTo(view).inset(20)
            $0.height.equalTo(100)
        }
        mainLabel.text = "미니게임한판"
        mainLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        mainLabel.backgroundColor = .gray
        mainLabel.textAlignment = .center
        
    }
    final private func setLiarGame() {
        view.addSubview(liarGameButton)
        liarGameButton.snp.makeConstraints {
            $0.top.equalTo(mainLabel.snp.bottom).offset(40)
            $0.leading.equalTo(mainLabel)
            $0.height.equalTo(100)
            $0.width.equalTo(160)
        }
        liarGameButton.backgroundColor = .red
        liarGameButton.setTitle("라이어게임", for: .normal)
        liarGameButton.addTarget(self, action: #selector(liarGame(_:)), for: .touchUpInside)
    }
    final private func setKoreanGame() {
        view.addSubview(koreanGameButton)
        koreanGameButton.snp.makeConstraints {
            $0.top.equalTo(liarGameButton)
            $0.trailing.equalTo(mainLabel)
            $0.height.equalTo(100)
            $0.width.equalTo(160)
        }
        koreanGameButton.backgroundColor = .orange
        koreanGameButton.setTitle("초성게임", for: .normal)
        koreanGameButton.addTarget(self, action: #selector(koreanGame(_:)), for: .touchUpInside)

    }
    final private func setMovieInitial() {
        view.addSubview(movieInitialGameButton)
        movieInitialGameButton.snp.makeConstraints {
            $0.top.equalTo(liarGameButton.snp.bottom).offset(30)
            $0.leading.equalTo(mainLabel)
            $0.height.equalTo(100)
            $0.width.equalTo(160)
        }
        movieInitialGameButton.backgroundColor = .green
        movieInitialGameButton.setTitle("영화이름초성게임", for: .normal)
        movieInitialGameButton.addTarget(self, action: #selector(movieInitialGame(_:)), for: .touchUpInside)
    }
    final private func setBombGame() {
        view.addSubview(bombGameButton)
        bombGameButton.snp.makeConstraints {
            $0.top.equalTo(movieInitialGameButton)
            $0.trailing.equalTo(mainLabel)
            $0.height.equalTo(100)
            $0.width.equalTo(160)
        }
        bombGameButton.backgroundColor = .yellow
        bombGameButton.setTitle("폭탄게임", for: .normal)
        bombGameButton.addTarget(self, action: #selector(bombGame(_:)), for: .touchUpInside)

    }
    
}
