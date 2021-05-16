//
//  MiniGameViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/04.
//



import UIKit
import SnapKit

class MiniGameViewController: UIViewController {
    
    let splashView = UIView()
    let logoImageView = UIImageView()

    let liarGameLabel = CustomGameLabel()
    let koreanGameLabel = CustomGameLabel()
    let movieInitialGameLabel = CustomGameLabel()
    let bombGameLabel = CustomGameLabel()
    let mainLogo = UIImageView()
    let bottomLogo = UIImageView()
    let gameTableView = UITableView()
    let game = ["라이어게임", "훈민정음게임", "영화제목초성게임", "폭탄게임"]
    let colors: [UIColor] = [UIColor(displayP3Red: 119/255, green: 255/255, blue: 0/255, alpha: 1), UIColor(displayP3Red: 255/255, green: 0/255, blue: 146/255, alpha: 1), UIColor(displayP3Red: 255/255, green: 255/255, blue: 0/255, alpha: 1), UIColor(displayP3Red: 0/255, green: 255/255, blue: 255/255, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}

extension MiniGameViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as? GameTableViewCell else { fatalError() }
        cell.GameLabel.backgroundColor = .darkGray
        let liarVC = LiarGameViewController()
        let koreanVC = KoreanQuizViewController()
        let movieVC = MovieInitialViewController()
        let bombVC = BombGameViewController()
        switch game[indexPath.row] {
        case "라이어게임":
            self.navigationController?.pushViewController(liarVC, animated: true)
        case "훈민정음게임":
            self.navigationController?.pushViewController(koreanVC, animated: true)
        case "영화제목초성게임":
            self.navigationController?.pushViewController(movieVC, animated: true)
        case "폭탄게임":
            self.navigationController?.pushViewController(bombVC, animated: true)
        default:
            break
        }
    }
}

extension MiniGameViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GameTableViewCell", for: indexPath) as? GameTableViewCell else { fatalError() }
        cell.GameLabel.layer.borderColor = colors[indexPath.item].cgColor
        cell.backgroundColor = .black
        cell.GameLabel.text = game[indexPath.row]
        cell.GameLabel.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        cell.selectionStyle = .none
        return cell
    }
}

extension MiniGameViewController {
    final private func setUI() {
        setLayout()
        setBasic()
        setTableView()
    }
 
    final private func setLayout() {
        
        view.addSubview(mainLogo)
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(240)
        }
        view.addSubview(bottomLogo)
        bottomLogo.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaInsets.bottom).inset(10)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(200)
        }
        view.addSubview(gameTableView)
        gameTableView.snp.makeConstraints {
            $0.leading.trailing.equalTo(view)
            $0.top.equalTo(mainLogo.snp.bottom)
            $0.bottom.equalTo(bottomLogo.snp.top)
        }
        gameTableView.rowHeight = 110
    }
   
    final private func setBasic() {
        let topGif = UIImage.gifImageWithName("TopLogo")
        mainLogo.image = topGif
        let bottomGif = UIImage.gifImageWithName("BottomLogo")
        bottomLogo.image = bottomGif
    }
    final private func setTableView() {
        gameTableView.backgroundColor = .black
        gameTableView.dataSource = self
        gameTableView.delegate = self
        gameTableView.register(GameTableViewCell.self, forCellReuseIdentifier: "GameTableViewCell")
    }
}

//final private func setlogoImageView() {
//    setlogoImage()
//    gameTableView.addSubview(splashView)
//    splashView.snp.makeConstraints {
//        $0.top.leading.trailing.bottom.equalToSuperview()
//    }
//    splashView.addSubview(logoImageView)
//    logoImageView.snp.makeConstraints {
//        $0.centerX.centerY.equalToSuperview()
//        $0.leading.trailing.equalToSuperview()
//        $0.height.equalTo(250)
//    }
//}
//final private func setlogoImage() {
//    splashView.backgroundColor = .black
//    let topGif = UIImage.gifImageWithName("logo")
//    logoImageView.image = topGif
//    splashView.alpha = 1
//    UIView.animate(withDuration: 6) {
//        self.splashView.alpha = 0
//    }
//}
