//
//  ViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/04/28.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let topicLabel = UILabel()
    let changeButton = UIButton()
    let topicViewLayout = UICollectionViewFlowLayout()
    lazy var topicView = UICollectionView(frame: .zero, collectionViewLayout: topicViewLayout)
    let topicButton = CustomTopicButton()
    let topics = ["가수", "음식", "브랜드", "동물", "장소", "탈것", "직업", "국내영화", "배우"]
    let wordLabel = UILabel()
    let paperView = UIView()
    
    let personView = UIView()
    var personInt: Int = 3
    let personLabel = UILabel()
    let upButton = UIButton()
    let downButton = UIButton()
    let startButton = UIButton()
    var row = 0 {
        willSet {
            print(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }


}

extension ViewController {
    @objc
    func startButton(_ sender: UIButton) {
        personView.isHidden = true
        changeButton.isHidden = true
    }
    @objc
    func tap(_ sender: UIButton) {
        setTopicView()
        topicView.alpha = 1
    }
    @objc
    func upButton(_ sender: UITapGestureRecognizer) {
        if personInt <= 19 {
            personInt += 1
        }
        personLabel.text = "참가인원: \(personInt)명"
    }
    @objc
    func downButton(_ sender: UITapGestureRecognizer) {
        if personInt >= 4 {
            personInt -= 1
        } else {
            personInt = 3
        }
        personLabel.text = "참가인원: \(personInt)명"
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as? TopicCollectionViewCell else { fatalError() }
        topicView.alpha = 0
        topicLabel.text = topics[indexPath.row]
        if topicLabel.text == "음식" {
            wordLabel.text = Word.shared.food[row]
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = topicView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as? TopicCollectionViewCell else { fatalError() }
        cell.topicLabel.text = topics[indexPath.row]
        cell.topicLabel.textAlignment = .center
        cell.backgroundColor = .white
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.systemIndigo.cgColor
        cell.layer.borderWidth = 2
        
        return cell
    }
    
    
}

extension ViewController {
    final private func setUI() {
        setBasics()
        setLayouts()
        setpersonView()
    }
    final private func setBasics() {
        changeButton.setTitle("변경", for: .normal)
        changeButton.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        changeButton.backgroundColor = .systemIndigo
        topicLabel.text = ""
        topicLabel.backgroundColor = .yellow
        wordLabel.backgroundColor = .systemPink
        wordLabel.textAlignment = .center
        paperView.backgroundColor = .green
    }
    final private func setLayouts() {
        view.addSubview(topicLabel)
        topicLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(view.snp.centerY).offset(-100)
            $0.width.equalTo(240)
            $0.height.equalTo(80)
        }
        topicLabel.addSubview(changeButton)
        changeButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalTo(topicLabel).inset(20)
            $0.width.equalTo(60)
        }
        view.addSubview(wordLabel)
        wordLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(topicLabel)
            $0.top.equalTo(topicLabel.snp.bottom).offset(50)
            $0.height.equalTo(160)
        }
        wordLabel.addSubview(paperView)
        paperView.snp.makeConstraints {
            $0.leading.equalTo(wordLabel.snp.leading).inset(20)
            $0.top.equalTo(wordLabel.snp.top).inset(20)
            $0.trailing.equalTo(wordLabel.snp.trailing).inset(20)
            $0.bottom.equalTo(wordLabel.snp.bottom).inset(20)
        }
    }
    final private func setTopicView() {
        setTopicViewLayout()
        view.addSubview(topicView)
        topicView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.width.equalTo(250)
            $0.height.equalTo(250)
        }
        topicView.dataSource = self
        topicView.delegate = self
        topicView.backgroundColor = .gray
        topicView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
    }
    final private func setTopicViewLayout() {
        topicViewLayout.scrollDirection = .vertical
        topicViewLayout.itemSize = CGSize(width: 70, height: 70)
        topicViewLayout.minimumInteritemSpacing = 10
        topicViewLayout.minimumLineSpacing = 10
        topicViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    final private func setPaperView() {
        
        
    }
    final private func setpersonView() {
        view.addSubview(personView)
        [personLabel, upButton, downButton, startButton].forEach {
        personView.addSubview($0)
        }
        personView.snp.makeConstraints {
            $0.leading.top.bottom.trailing.equalTo(wordLabel)
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
        startButton.snp.makeConstraints {
            $0.leading.equalTo(personLabel).inset(20)
            $0.trailing.equalTo(upButton).inset(20)
            $0.top.equalTo(personLabel.snp.bottom).offset(60)
            $0.height.equalTo(30)
        }
        
        personView.backgroundColor = .systemIndigo
        startButton.backgroundColor = .red
        startButton.setTitle("게임시작", for: .normal)
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        personLabel.text = "참가인원: \(personInt)명"
        personLabel.textAlignment = .center
        personLabel.backgroundColor = .orange
        
        upButton.backgroundColor = .yellow
        let upButtonTaped = UITapGestureRecognizer(target: self, action: #selector(upButton(_:)))
        upButtonTaped.numberOfTouchesRequired = 1
        upButtonTaped.numberOfTapsRequired = 1
        upButton.addGestureRecognizer(upButtonTaped)
        upButton.isUserInteractionEnabled = true
        
        downButton.backgroundColor = .gray
        let downButtonTaped = UITapGestureRecognizer(target: self, action: #selector(downButton(_:)))
        downButtonTaped.numberOfTouchesRequired = 1
        downButtonTaped.numberOfTapsRequired = 1
        downButton.addGestureRecognizer(downButtonTaped)
        downButton.isUserInteractionEnabled = true
        
    }
}
