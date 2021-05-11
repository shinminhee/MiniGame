//
//  MiniGameViewControllerTwo.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/07.
//

import UIKit
import SnapKit

class MiniGameViewControllerTwo: UIViewController {
    
    let liarGameLabel = CustomGameLabel()
    let koreanGameLabel = CustomGameLabel()
    let movieInitialGameLabel = CustomGameLabel()
    let bombGameLabel = CustomGameLabel()
    let mainLogo = UIImageView()
    let bottomLogo = UIImageView()
    let gameTableView = UITableView()
    let game = ["라이어게임", "훈민정음게임", "영화이름초성게임", "폭탄게임"]
    let colors: [UIColor] = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemPink, UIColor.systemYellow, UIColor.systemIndigo]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}

extension MiniGameViewControllerTwo: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let liarVC = LiarGameViewController()
        let koreanVC = KoreanQuizViewControllerTwo()
        let movieVC = MovieInitialViewController()
        let bombVC = BombGameViewController()
        switch game[indexPath.row] {
        case "라이어게임":
            present(liarVC, animated: true, completion: nil)
        case "훈민정음게임":
            present(koreanVC, animated: true, completion: nil)
        case "영화이름초성게임":
            present(movieVC, animated: true, completion: nil)
        case "폭탄게임":
            present(bombVC, animated: true, completion: nil)
        default:
            break
        }
    }
}

extension MiniGameViewControllerTwo: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as? GameTableViewCell else { fatalError() }
        cell.GameLabel.layer.borderColor = colors[indexPath.item].cgColor
        cell.backgroundColor = .black
        cell.GameLabel.text = game[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
}

extension MiniGameViewControllerTwo {
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

extension MiniGameViewControllerTwo {
    final private func setUI() {
        setLayout()
        setBasic()
        setTableView()
        
    }
    final private func setLayout() {
        view.addSubview(mainLogo)
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(30)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(130)
        }
        view.addSubview(bottomLogo)
        bottomLogo.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaInsets.bottom).inset(10)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(150)
        }
        view.addSubview(gameTableView)
        gameTableView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view)
            $0.top.equalTo(mainLogo.snp.bottom)
            $0.bottom.equalTo(bottomLogo.snp.top)
        }
        gameTableView.rowHeight = 140

    }
   
    final private func setBasic() {
        bottomLogo.image = UIImage(named: "BottomLogo")
        mainLogo.image = UIImage(named: "NeonLogoImage")
    }
    final private func setTableView() {
        gameTableView.backgroundColor = .black
        gameTableView.dataSource = self
        gameTableView.delegate = self
        gameTableView.register(GameTableViewCell.self, forCellReuseIdentifier: "GameTableViewCell")
    }
    
    final private func setLiarGame() {
        view.addSubview(liarGameLabel)
        liarGameLabel.snp.makeConstraints {
            $0.top.equalTo(mainLogo.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(view).inset(20)
            $0.height.equalTo(90)
        }
        let liarGameButton = UITapGestureRecognizer(target: self, action: #selector(liarGame(_:)))
        self.liarGameLabel.gestureRecognizers = [liarGameButton]
        liarGameLabel.addGestureRecognizer(liarGameButton)
        liarGameLabel.isUserInteractionEnabled = true
        liarGameLabel.layer.borderColor = UIColor(displayP3Red: 232/255, green: 65/255, blue: 14/255, alpha: 0.5).cgColor
        liarGameLabel.text = "라이어게임"
        let text = "라이어게임"
        let attributedStr = NSMutableAttributedString(string: text)
        attributedStr.addAttribute(.strokeWidth, value: 4.0, range: (text as NSString).range(of: "라이어게임"))
        
    }
    final private func setKoreanGame() {
        view.addSubview(koreanGameLabel)
        koreanGameLabel.snp.makeConstraints {
            $0.top.equalTo(liarGameLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(view).inset(20)
            $0.height.equalTo(90)
        }
        let koreanGameButton = UITapGestureRecognizer(target: self, action: #selector(koreanGame(_:)))
        self.koreanGameLabel.gestureRecognizers = [koreanGameButton]
        koreanGameLabel.addGestureRecognizer(koreanGameButton)
        koreanGameLabel.isUserInteractionEnabled = true
        koreanGameLabel.layer.borderColor = UIColor(displayP3Red: 66/255, green: 215/255, blue: 97/255, alpha: 0.5).cgColor
        koreanGameLabel.text = "초성게임"
//        koreanGameButton.addTarget(self, action: #selector(koreanGame(_:)), for: .touchUpInside)

    }
    final private func setMovieInitial() {
        view.addSubview(movieInitialGameLabel)
        movieInitialGameLabel.snp.makeConstraints {
            $0.top.equalTo(koreanGameLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(view).inset(20)
            $0.height.equalTo(90)
        }
        let movieInitialGameButton = UITapGestureRecognizer(target: self, action: #selector(movieInitialGame(_:)))
        self.movieInitialGameLabel.gestureRecognizers = [movieInitialGameButton]
        movieInitialGameLabel.addGestureRecognizer(movieInitialGameButton)
        movieInitialGameLabel.isUserInteractionEnabled = true
        movieInitialGameLabel.layer.borderColor = UIColor(displayP3Red: 255/255, green: 204/255, blue: 51/255, alpha: 0.5).cgColor
        movieInitialGameLabel.text = "영화이름초성게임"
    }
    final private func setBombGame() {
        view.addSubview(bombGameLabel)
        bombGameLabel.snp.makeConstraints {
            $0.top.equalTo(movieInitialGameLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalTo(view).inset(20)
            $0.height.equalTo(90)
        }
        let bombGameButton = UITapGestureRecognizer(target: self, action: #selector(bombGame(_:)))
        self.bombGameLabel.gestureRecognizers = [bombGameButton]
        bombGameLabel.addGestureRecognizer(bombGameButton)
        bombGameLabel.isUserInteractionEnabled = true
        bombGameLabel.layer.borderColor = UIColor(displayP3Red: 0/255, green: 59/255, blue: 255/255, alpha: 0.5).cgColor
        bombGameLabel.text = "폭탄게임"

    }
    
}
