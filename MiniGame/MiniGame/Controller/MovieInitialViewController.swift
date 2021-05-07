//
//  MovieInitialViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/03.
//

import UIKit

class MovieInitialViewController: UIViewController {
    
    let qAndALabel = UILabel()
    var qAndAText = ""
    let personView = UIView()
    let personLabel = UILabel()
    var personInt = 0
    var personNum = 0
    let upButton = UIButton()
    let downButton = UIButton()
    let startButton = UIButton()
    let nextButton = UIButton()
    var unSelected = [""]
    let qaTitle = ["문제", "정답"]
    let answerButton = UIButton()
  

    


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()

    }

}

//extension MovieInitialViewController: UICollectionViewDelegate {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = personCollectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.identifier, for: indexPath) as? PersonCollectionViewCell else { fatalError() }
//        score += 1
//        cell.scoreNumber.text = "\(score)"
//        print(score)
//    }
//
//}
//extension MovieInitialViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return personInt
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = personCollectionView.dequeueReusableCell(withReuseIdentifier: PersonCollectionViewCell.identifier, for: indexPath) as? PersonCollectionViewCell else { fatalError() }
//        cell.backgroundColor = .red
//        cell.scoreNumber.text = "\(score)"
//        cell.scoreNumber.textAlignment = .center
//        cell.personName.text = "\(indexPath.row)"
//        return cell
//
//    }
//}

extension MovieInitialViewController {
    @objc
    func answerButton(_ sender: UIButton) {
        answerButton.isHidden = true
        let selected =  MovieAlphabet.shared.dicQAndA["\(qAndAText)"] ?? [""]
        unSelected = selected
        qAndALabel.text = "\(unSelected)"
    }
    @objc
    func nextButton(_ sender: UIButton) {
        answerButton.isHidden = false
        qAndAText = MovieAlphabet.shared.qAndA["\(qaTitle[0])"]?.randomElement() ?? ""
        qAndALabel.text = qAndAText
    }

    @objc
    func startButton(_ sender: UIButton) {
        nextButton.isHidden = false
        answerButton.isHidden = false
        qAndAText = MovieAlphabet.shared.qAndA["\(qaTitle[0])"]?.randomElement() ?? ""
        print(qAndAText)
        personView.isHidden = true
        qAndALabel.text = qAndAText
        
//        personCollectionView.dataSource = self
//        UIView.animate(withDuration: 2) {
//            self.personCollectionView.frame = CGRect(x: self.personCollectionView.center.x, y: self.personCollectionView.center.y, width: 70, height: 70)
//
//        }
    }
    @objc
    func upButton(_ sender: UIButton) {
        if personInt <= 9 {
            personInt += 1
        }
        personLabel.text = "참가인원: \(personInt)명"
    }
    @objc
    func downButton(_ sender: UIButton) {
        if personInt >= 2 {
            personInt -= 1
        } else {
            personInt = 1
        }
        personLabel.text = "참가인원: \(personInt)명"
    }
}

extension MovieInitialViewController {
    final private func setUI() {
        setQAndALabel()
        setPersonView()
        setNextButton()
//        setpersonCollectionView()
    }     
//    final private func setpersonCollectionView() {
//        setPersonCollectionViewLayout()
//        view.addSubview(personCollectionView)
//        personCollectionView.snp.makeConstraints {
//            $0.leading.trailing.equalToSuperview().inset(20)
//            $0.top.equalTo(answerButton.snp.bottom).offset(20)
//            $0.bottom.equalTo(view.safeAreaInsets.bottom).inset(20)
//        }
//        personCollectionView.delegate = self
//        personCollectionView.backgroundColor = .gray
//        personCollectionView.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: PersonCollectionViewCell.identifier)
//    }
//    final private func setPersonCollectionViewLayout() {
//        personCollectionViewLayout.scrollDirection = .vertical
//        personCollectionViewLayout.itemSize = CGSize(width: 70, height: 70)
//        personCollectionViewLayout.minimumInteritemSpacing = 10
//        personCollectionViewLayout.minimumLineSpacing = 10
//        personCollectionViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
//    }
    final private func setNextButton() {
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.top.equalTo(qAndALabel.snp.bottom).offset(20)
            $0.leading.trailing.equalTo(qAndALabel)
            $0.height.equalTo(30)
        }
        view.addSubview(answerButton)
        answerButton.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(nextButton)
        }
        nextButton.backgroundColor = .gray
        nextButton.addTarget(self, action: #selector(nextButton(_:)), for: .touchUpInside)
        nextButton.setTitle("다음문제", for: .normal)
        nextButton.backgroundColor = .black
        nextButton.layer.borderWidth = 3
        nextButton.layer.borderColor = UIColor.yellow.cgColor
        nextButton.isHidden = true
        
        answerButton.backgroundColor = .green
        answerButton.addTarget(self, action: #selector(answerButton(_:)), for: .touchUpInside)
        answerButton.setTitle("정답확인", for: .normal)
        answerButton.backgroundColor = .black
        answerButton.layer.borderWidth = 3
        answerButton.layer.borderColor = UIColor.green.cgColor
        answerButton.isHidden = true

    }
    final private func setPersonView() {
        view.addSubview(personView)
        [personLabel, upButton, downButton, startButton].forEach {
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
        startButton.snp.makeConstraints {
            $0.leading.equalTo(personLabel).inset(20)
            $0.trailing.equalTo(upButton).inset(20)
            $0.top.equalTo(personLabel.snp.bottom).offset(60)
            $0.height.equalTo(30)
        }
        
        personView.backgroundColor = .yellow
        personLabel.backgroundColor = .red
        personLabel.text = "참가인원: \(personInt)명"
        
        upButton.backgroundColor = .purple
        downButton.backgroundColor = .systemPink
        upButton.addTarget(self, action: #selector(upButton(_:)), for: .touchUpInside)
        downButton.addTarget(self, action: #selector(downButton(_:)), for: .touchUpInside)
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.layer.borderColor = UIColor.red.cgColor
        startButton.layer.borderWidth = 3
        startButton.backgroundColor = .black
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        
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
