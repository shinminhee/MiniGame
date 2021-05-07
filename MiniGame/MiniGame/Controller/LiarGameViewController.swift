//
//  ViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/04/28.
//

import UIKit
import SnapKit

class LiarGameViewController: UIViewController {
    
    let modeView = UILabel()
    let modeLeftButton = UIButton()
    let modeRightButton = UIButton()
    
    let topicLabel = UILabel()
    let changeButton = UIButton()
    
    let topicViewLayout = UICollectionViewFlowLayout()
    lazy var topicView = UICollectionView(frame: .zero, collectionViewLayout: topicViewLayout)
    let topics = ["가수", "음식", "브랜드", "동물", "장소", "탈것", "직업", "국내영화", "배우"]
    
    let mode = ["노말모드", "스파이모드", "바보모드"]
    var modeIndex = 0
    let wordLabel = UILabel()
    let paperView = UIView()
    
    let personView = UIView()
    var personNum = 0
    var personInt = 3
    let personLabel = UILabel()
    var liarNum = 0
    let upButton = UIButton()
    let downButton = UIButton()
    let startButton = CustomStartButton()
    let okButton = UIButton()
    var personText = ""
    var unSelected = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}

extension LiarGameViewController {
    
    @objc
    func startButton(_ sender: UIButton) {
        if topicLabel.text?.count ?? 0 <= 5 {
        paperView.isHidden = false
        personText = Word.shared.topicManager["\(topicLabel.text ?? "")"]?.randomElement() ?? ""
        personView.isHidden = true
        changeButton.isHidden = true
        personNum = personInt
        wordLabel.text = personText
        liarNum = Int.random(in: 1 ... personInt)
        var selected = Word.shared.topicManager["\(topicLabel.text ?? "")"] ?? [""]
        selected.removeAll(where: { $0 == personText })
        unSelected = selected
        print(selected)
        }
    }
    
    @objc
    func okButton(_ sender: UIButton) {
        if personNum != 1 {
            personNum -= 1
            paperView.isHidden = false
        } else {
            personView.isHidden = false
            changeButton.isHidden = false
        }
    }
    @objc
    func paperViewTaped(_ sender: UITapGestureRecognizer) {
        if personNum == liarNum {
            switch modeView.text {
            case "노말모드":
                wordLabel.text = "당신은 라이어입니다."
            case "스파이모드":
                wordLabel.text = "당신은 라이어입니다."
            case "바보모드":
                wordLabel.text = unSelected.randomElement()
            default:
                break
            }
            paperView.isHidden = true
        } else {
            paperView.isHidden = true
            wordLabel.text = personText
        }
    }
    
    @objc
    func changeButton(_ sender: UIButton) {
        setTopicCollectionView()
        topicView.alpha = 1
        [personView, topicLabel, startButton, paperView, wordLabel, okButton, changeButton].forEach {
            $0.alpha = 0
        }
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
    @objc
    func rightButton(_ sender: UIButton) {
        if modeIndex != 2 {
            modeIndex += 1
            modeView.text = mode[modeIndex]
        } else {
            modeIndex = 0
            modeView.text = mode[modeIndex]
        }
    }
    @objc
    func leftButton(_ sender: UIButton) {
        if modeIndex != 0 {
            modeIndex -= 1
            modeView.text = mode[modeIndex]
        } else {
            modeIndex = 2
            modeView.text = mode[modeIndex]
        }
    }
}

extension LiarGameViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        topicView.alpha = 0
        topicLabel.text = topics[indexPath.row]
        topicLabel.textAlignment = .center
        [personView, topicLabel, startButton, paperView, wordLabel, okButton, changeButton].forEach {
            $0.alpha = 1
        }
    }
}

extension LiarGameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return topics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = topicView.dequeueReusableCell(withReuseIdentifier: TopicCollectionViewCell.identifier, for: indexPath) as? TopicCollectionViewCell else { fatalError() }
        cell.topicLabel.text = topics[indexPath.row]
        cell.topicLabel.textAlignment = .center
        cell.topicLabel.textColor = .white
        cell.backgroundColor = .black
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = UIColor.systemIndigo.cgColor
        cell.layer.borderWidth = 2
        return cell
    }
}

extension LiarGameViewController {
    
    final private func setUI() {
        setTopicView()
        setWordLabel()
        setPaperView()
        setpersonView()
    }
    final private func setTopicView() {
        view.addSubview(topicLabel)
        topicLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(view.snp.centerY).offset(-150)
            $0.width.equalTo(240)
            $0.height.equalTo(80)
        }
        view.addSubview(changeButton)
        changeButton.snp.makeConstraints {
            $0.trailing.top.bottom.equalTo(topicLabel).inset(20)
            $0.width.equalTo(60)
        }
        changeButton.setTitle("변경", for: .normal)
        changeButton.addTarget(self, action: #selector(changeButton(_:)), for: .touchUpInside)
        changeButton.backgroundColor = .systemIndigo
        
        topicLabel.text = "   주제를 선택해 주세요"
        topicLabel.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        topicLabel.textColor = .white
        topicLabel.backgroundColor = .black
        topicLabel.layer.borderWidth = 3
        topicLabel.layer.borderColor = UIColor.yellow.cgColor
    }
    final private func setWordLabel() {
        view.addSubview(wordLabel)
        wordLabel.snp.makeConstraints {
            $0.leading.trailing.equalTo(topicLabel)
            $0.top.equalTo(topicLabel.snp.bottom).offset(50)
            $0.height.equalTo(160)
        }
        view.addSubview(okButton)
        okButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(wordLabel).inset(30)
            $0.bottom.equalTo(wordLabel.snp.bottom).inset(10)
            $0.height.equalTo(20)
        }
        okButton.backgroundColor = .white
        okButton.addTarget(self, action: #selector(okButton(_:)), for: .touchUpInside)
        wordLabel.backgroundColor = .systemPink
        wordLabel.textAlignment = .center
    }
    final private func setPaperView() {
        view.addSubview(paperView)
        paperView.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalTo(wordLabel).inset(20)
        }
        paperView.backgroundColor = .green
        let paperViewTaped = UITapGestureRecognizer(target: self, action: #selector(paperViewTaped(_:)))
        paperViewTaped.numberOfTouchesRequired = 1
        paperViewTaped.numberOfTapsRequired = 1
        paperView.addGestureRecognizer(paperViewTaped)
        paperView.isUserInteractionEnabled = true
    }
    final private func setpersonView() {
        view.addSubview(personView)
        [personLabel, upButton, downButton, startButton, modeView, modeLeftButton, modeRightButton].forEach {
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
        modeView.snp.makeConstraints {
            $0.centerX.centerY.equalTo(personView)
            $0.height.equalTo(30)
            $0.width.equalTo(80)
        }
        modeLeftButton.snp.makeConstraints {
            $0.leading.equalTo(personLabel).inset(20)
            $0.top.bottom.equalTo(modeView)
            $0.trailing.equalTo(modeView.snp.leading)
        }
        modeRightButton.snp.makeConstraints {
            $0.trailing.equalTo(upButton).inset(20)
            $0.top.bottom.equalTo(modeView)
            $0.leading.equalTo(modeView.snp.trailing)
        }
        startButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(personView)
            $0.top.equalTo(personView.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        modeView.text = "\(mode[0])"
        modeView.textColor = .white
        modeView.textAlignment = .center
        
        modeRightButton.backgroundColor = .red
        modeRightButton.addTarget(self, action: #selector(rightButton(_:)), for: .touchUpInside)
        modeLeftButton.backgroundColor = .red
        modeLeftButton.addTarget(self, action: #selector(leftButton(_:)), for: .touchUpInside)
        
        personView.backgroundColor = .black
        personView.layer.borderColor = UIColor.systemIndigo.cgColor
        personView.layer.borderWidth = 3
        
        
        startButton.layer.borderColor = UIColor.red.cgColor
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
    final private func setTopicCollectionView() {
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
        topicView.backgroundColor = .clear
        topicView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
    }
    final private func setTopicViewLayout() {
        topicViewLayout.scrollDirection = .vertical
        topicViewLayout.itemSize = CGSize(width: 70, height: 70)
        topicViewLayout.minimumInteritemSpacing = 10
        topicViewLayout.minimumLineSpacing = 10
        topicViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
