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
    let mainLogo = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
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
        view.addSubview(mainLogo)
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(50)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(180)
        }
        mainLogo.image = UIImage(named: "NeonLogoImage")
//        mainLogo.image = UIImage(named: "logo")
        
    }
    final private func setLiarGame() {
        view.addSubview(liarGameButton)
        liarGameButton.snp.makeConstraints {
            $0.top.equalTo(mainLogo.snp.bottom).offset(40)
            $0.leading.equalTo(mainLogo)
            $0.height.equalTo(100)
            $0.width.equalTo(160)
        }
        liarGameButton.backgroundColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1)
        liarGameButton.layer.borderColor = UIColor(red: 231/255, green: 76/255, blue: 60/255, alpha: 1).cgColor
        liarGameButton.layer.borderWidth = 1
        liarGameButton.layer.shadowColor = UIColor.white.cgColor // 색깔
        liarGameButton.layer.masksToBounds = false
        liarGameButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        liarGameButton.layer.shadowRadius = 5
        liarGameButton.layer.shadowOpacity = 0.3
        liarGameButton.setTitle("라이어게임", for: .normal)
        liarGameButton.titleLabel?.font = UIFont(name: "Swift-Regular_43151", size: 20)
        liarGameButton.addTarget(self, action: #selector(liarGame(_:)), for: .touchUpInside)
    }
    final private func setKoreanGame() {
        view.addSubview(koreanGameButton)
        koreanGameButton.snp.makeConstraints {
            $0.top.equalTo(liarGameButton)
            $0.trailing.equalTo(mainLogo)
            $0.height.equalTo(100)
            $0.width.equalTo(160)
        }
        koreanGameButton.backgroundColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1)
        koreanGameButton.layer.borderColor = UIColor(red: 230/255, green: 126/255, blue: 34/255, alpha: 1).cgColor
        koreanGameButton.layer.borderWidth = 1
        koreanGameButton.layer.shadowColor = UIColor.white.cgColor // 색깔
        koreanGameButton.layer.masksToBounds = false
        koreanGameButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        koreanGameButton.layer.shadowRadius = 5
        koreanGameButton.layer.shadowOpacity = 0.3
        koreanGameButton.setTitle("초성게임", for: .normal)
        koreanGameButton.addTarget(self, action: #selector(koreanGame(_:)), for: .touchUpInside)

    }
    final private func setMovieInitial() {
        view.addSubview(movieInitialGameButton)
        movieInitialGameButton.snp.makeConstraints {
            $0.top.equalTo(liarGameButton.snp.bottom).offset(30)
            $0.leading.equalTo(mainLogo)
            $0.height.equalTo(100)
            $0.width.equalTo(160)
        }
        movieInitialGameButton.backgroundColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1)
        movieInitialGameButton.layer.borderColor = UIColor(red: 46/255, green: 204/255, blue: 113/255, alpha: 1).cgColor
        movieInitialGameButton.layer.borderWidth = 1
        movieInitialGameButton.layer.shadowColor = UIColor.white.cgColor // 색깔
        movieInitialGameButton.layer.masksToBounds = false
        movieInitialGameButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        movieInitialGameButton.layer.shadowRadius = 5
        movieInitialGameButton.layer.shadowOpacity = 0.3
        movieInitialGameButton.setTitle("영화이름초성게임", for: .normal)
        movieInitialGameButton.addTarget(self, action: #selector(movieInitialGame(_:)), for: .touchUpInside)
    }
    final private func setBombGame() {
        view.addSubview(bombGameButton)
        bombGameButton.snp.makeConstraints {
            $0.top.equalTo(movieInitialGameButton)
            $0.trailing.equalTo(mainLogo)
            $0.height.equalTo(100)
            $0.width.equalTo(160)
        }
        bombGameButton.backgroundColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1)
        bombGameButton.layer.borderColor = UIColor(red: 255/255, green: 212/255, blue: 100/255, alpha: 1).cgColor
        bombGameButton.layer.borderWidth = 1
        bombGameButton.layer.shadowColor = UIColor.white.cgColor // 색깔
        bombGameButton.layer.masksToBounds = false
        bombGameButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        bombGameButton.layer.shadowRadius = 5
        bombGameButton.layer.shadowOpacity = 0.3
        bombGameButton.setTitle("폭탄게임", for: .normal)
        bombGameButton.addTarget(self, action: #selector(bombGame(_:)), for: .touchUpInside)

    }
    
}
