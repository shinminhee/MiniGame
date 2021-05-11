//
//  MiniGameViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/04.
//



import UIKit
import SnapKit

class MiniGameViewController: UIViewController {
    
    let liarGameLabel = CustomGameLabel()
    let koreanGameLabel = CustomGameLabel()
    let movieInitialGameLabel = CustomGameLabel()
    let bombGameLabel = CustomGameLabel()
    let mainLogo = UIImageView()
    let bottomLogo = UIImageView()
    let gameTableView = UITableView()
    let game = ["라이어게임", "훈민정음게임", "영화제목초성게임", "폭탄게임"]
    let colors: [UIColor] = [UIColor.systemRed, UIColor.systemBlue, UIColor.systemPink, UIColor.systemYellow, UIColor.systemIndigo]
    
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
        let koreanVC = KoreanQuizViewControllerTwo()
        let movieVC = MovieInitialViewController()
        let bombVC = BombGameViewController()
        switch game[indexPath.row] {
        case "라이어게임":
            present(liarVC, animated: true, completion: nil)
        case "훈민정음게임":
            present(koreanVC, animated: true, completion: nil)
        case "영화제목초성게임":
            present(movieVC, animated: true, completion: nil)
        case "폭탄게임":
            present(bombVC, animated: true, completion: nil)
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
//        let text = "\(String(describing: cell.GameLabel.text))"
//        let attributedStr = NSMutableAttributedString(string: text)
//        attributedStr.addAttribute(.strokeWidth, value: 4.0, range: (text as NSString).range(of: "\(String(describing: cell.GameLabel.text))"))
//        cell.GameLabel.attributedText = attributedStr
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
            $0.top.equalTo(view.safeAreaInsets.top).inset(10)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(240)
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
        gameTableView.rowHeight = 120
    }
   
    final private func setBasic() {
        bottomLogo.image = UIImage(named: "BottomLogo")
        mainLogo.image = UIImage(named: "TopLogo")
    }
    final private func setTableView() {
        gameTableView.backgroundColor = .black
        gameTableView.dataSource = self
        gameTableView.delegate = self
        gameTableView.register(GameTableViewCell.self, forCellReuseIdentifier: "GameTableViewCell")
    }
}
