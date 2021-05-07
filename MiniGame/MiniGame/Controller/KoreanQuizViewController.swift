//
//  KoreanQuizViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/01.
//

import UIKit

class KoreanQuizViewController: UIViewController {
    
    let koreanLabel = UILabel()
    let alphabetView = UIView()
    let startButton = CustomStartButton()
    let KoreanViewLayout = UICollectionViewFlowLayout()
    lazy var KoreanView = UICollectionView(frame: .zero, collectionViewLayout: KoreanViewLayout)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
    
    @objc
    func tap(_ sender: UIButton) {
        let arraynum: Int = Korean.shared.first.count // 메시지 배열의 요소 개수를 세서 arraynum 변수에 할당
        let firstNumbers = Int.random(in: 0 ..< arraynum) // 랜덤으로 수를 골라 numbers 변수에 할당
        let firstMessage = Korean.shared.first[firstNumbers]
        let secondNumbers = Int.random(in: 0 ..< arraynum)
        let secondMessage = Korean.shared.first[secondNumbers]
        koreanLabel.text = "\(firstMessage) \(secondMessage)"
        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.toValue = Double.pi
        rotation.duration = 0.25 // 1바퀴 도는데 걸리는 시간
        rotation.isCumulative = true
        rotation.repeatCount = 8 // 몇번 반복 할것인가
        self.alphabetView.layer.add(rotation, forKey: "rotationAnimation") // 원하는 뷰에 애니메이션 삽입
    }
}

extension KoreanQuizViewController {
    
    final private func setUI() {
        setBasics()
        setLayouts()
    }
    final private func setBasics() {
        koreanLabel.backgroundColor = .black
        koreanLabel.textAlignment = .center
        koreanLabel.layer.borderColor = UIColor.yellow.cgColor
        koreanLabel.layer.borderWidth = 3
        koreanLabel.textColor = .white
        alphabetView.backgroundColor = .green
        alphabetView.alpha = 0
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        startButton.layer.borderColor = UIColor.green.cgColor
    }
    
    final private func setLayouts() {
        koreanLabel.addSubview(alphabetView)
        alphabetView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
        view.addSubview(koreanLabel)
        koreanLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(koreanLabel)
            $0.top.equalTo(koreanLabel.snp.bottom).offset(50)
            $0.height.equalTo(50)
        }
}
    final private func setKoreanCollectionView() {
        setKoreanViewLayout()
        view.addSubview(KoreanView)
        KoreanView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
//        KoreanView.dataSource = self
//        KoreanView.delegate = self
        KoreanView.backgroundColor = .clear
        KoreanView.register(TopicCollectionViewCell.self, forCellWithReuseIdentifier: TopicCollectionViewCell.identifier)
    }
    final private func setKoreanViewLayout() {
        KoreanViewLayout.scrollDirection = .vertical
        KoreanViewLayout.itemSize = CGSize(width: 70, height: 70)
        KoreanViewLayout.minimumInteritemSpacing = 10
        KoreanViewLayout.minimumLineSpacing = 10
        KoreanViewLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }}
