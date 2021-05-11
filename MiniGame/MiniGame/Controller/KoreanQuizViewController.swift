//
//  KoreanQuizViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/01.
//

import UIKit
import AVFoundation


class KoreanQuizViewController: UIViewController {
    
    let koreanLabel = UILabel()
    let startButton = CustomStartButton()
    let nextButton = CustomStartButton()
    let KoreanCollectionViewLayout = UICollectionViewFlowLayout()
    lazy var KoreanCollectionView = UICollectionView(frame: .zero, collectionViewLayout: KoreanCollectionViewLayout)
    var timerLabel = UILabel()
    var timer: Timer?
    var count = 6
    let alarm: SystemSoundID = 1005
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}

extension KoreanQuizViewController {
    @objc
    func timerCount() {
        self.count -= 1
        timerLabel.text = "\(count)"
        nextButton.isHidden = false
        if count <= 0 {
            AudioServicesPlaySystemSound(alarm)
            timer?.invalidate()
            timer = nil
            timerLabel.alpha = 0
        }
    }
    @objc
    func startButton(_ sender: UIButton) {
        let arraynum: Int = Korean.shared.first.count // 메시지 배열의 요소 개수를 세서 arraynum 변수에 할당
        let firstNumbers = Int.random(in: 0 ..< arraynum) // 랜덤으로 수를 골라 numbers 변수에 할당
        let firstMessage = Korean.shared.first[firstNumbers]
        let secondNumbers = Int.random(in: 0 ..< arraynum)
        let secondMessage = Korean.shared.first[secondNumbers]
        koreanLabel.text = "\(firstMessage) \(secondMessage)"
        backAnimation()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
    }
    @objc
    func nextButton(_ sender: UIButton) {
        let arraynum: Int = Korean.shared.first.count // 메시지 배열의 요소 개수를 세서 arraynum 변수에 할당
        let firstNumbers = Int.random(in: 0 ..< arraynum) // 랜덤으로 수를 골라 numbers 변수에 할당
        let firstMessage = Korean.shared.first[firstNumbers]
        let secondNumbers = Int.random(in: 0 ..< arraynum)
        let secondMessage = Korean.shared.first[secondNumbers]
        koreanLabel.text = "\(firstMessage) \(secondMessage)"
        backAnimation()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true)
    }
}

extension KoreanQuizViewController {
    final private func setUI() {
        setBasics()
        setLayouts()
    }
    final private func backAnimation() {
        backView()
        UIView.animate(withDuration: 1, delay: 0, options:.transitionCurlUp, animations: {
            self.view.layoutIfNeeded()
        },completion: nil)
    }
    func backView() {
        koreanLabel.snp.remakeConstraints{
            $0.top.equalTo(view.snp.top).inset(200)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(100)
            }
        }
    
 
    final private func setBasics() {
        koreanLabel.backgroundColor = .black
        koreanLabel.layer.borderColor = UIColor.yellow.cgColor
        koreanLabel.layer.borderWidth = 3
        koreanLabel.textAlignment = .center
        koreanLabel.textColor = .white
      
        startButton.setTitle("시작하기", for: .normal)
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        startButton.layer.borderColor = UIColor.green.cgColor
        
        timerLabel.textColor = .white
        timerLabel.textAlignment = .center
        timerLabel.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        
        nextButton.setTitle("다음문제", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButton(_:)), for: .touchUpInside)
        nextButton.layer.borderColor = UIColor.systemPink.cgColor
    }
    
    final private func setTimer() {
       
    }
    
    final private func setLayouts() {
        view.addSubview(koreanLabel)
        koreanLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        view.addSubview(timerLabel)
        timerLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        view.addSubview(startButton)
        startButton.snp.makeConstraints {
            $0.leading.trailing.equalTo(view).inset(40)
            $0.bottom.equalTo(view.snp.bottom).inset(200)
            $0.height.equalTo(50)
        }
        view.addSubview(nextButton)
        nextButton.snp.makeConstraints {
            $0.leading.top.trailing.bottom.equalTo(startButton)
        }
        nextButton.isHidden = true
    }
}

//final private func setKoreanCollectionView() {
//    setKoreanViewLayout()
//    view.addSubview(KoreanCollectionView)
//    KoreanCollectionView.snp.makeConstraints {
//        $0.centerX.centerY.equalToSuperview()
//        $0.width.equalTo(200)
//        $0.height.equalTo(200)
//    }
//    KoreanCollectionView.dataSource = self
//    KoreanCollectionView.backgroundColor = .clear
//    KoreanCollectionView.register(KoreanCollectionViewCell.self, forCellWithReuseIdentifier: KoreanCollectionViewCell.identifier)
//}
//final private func setKoreanViewLayout() {
//    KoreanCollectionViewLayout.scrollDirection = .vertical
//    KoreanCollectionViewLayout.itemSize = CGSize(width: 66, height: 66)
//    KoreanCollectionViewLayout.minimumInteritemSpacing = 0
//    KoreanCollectionViewLayout.minimumLineSpacing = 0
//    KoreanCollectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//}
//extension KoreanQuizViewController: UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 9
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = KoreanCollectionView.dequeueReusableCell(withReuseIdentifier: KoreanCollectionViewCell.identifier, for: indexPath) as? KoreanCollectionViewCell else { fatalError() }
//        let arraynum: Int = Korean.shared.first.count // 메시지 배열의 요소 개수를 세서 arraynum 변수에 할당
//        let firstNumbers = Int.random(in: 0 ..< arraynum) // 랜덤으로 수를 골라 numbers 변수에 할당
//        let firstMessage = Korean.shared.first[firstNumbers]
//        let secondNumbers = Int.random(in: 0 ..< arraynum)
//        let secondMessage = Korean.shared.first[secondNumbers]
//        cell.koreanLabel.text = "\(firstMessage) \(secondMessage)"
//        cell.koreanLabel.textColor = .white
//        cell.koreanLabel.layer.borderColor = UIColor.yellow.cgColor
//        cell.koreanLabel.layer.borderWidth = 1.5
//        cell.koreanLabel.textAlignment = .center
//        cell.backgroundColor = .darkGray
//        var randomInt = 0
//        randomInt = Int.random(in: 0 ... indexPath.row)
//        print(randomInt)
//        UIView.animate(withDuration: 2) {
//
//        }
//
//        return cell
//    }
//
//
//}

//        let rotation: CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation")
//        rotation.toValue = Double.pi
//        rotation.duration = 0.25 // 1바퀴 도는데 걸리는 시간
//        rotation.isCumulative = true
//        rotation.repeatCount = 8 // 몇번 반복 할것인가
//        self.alphabetView.layer.add(rotation, forKey: "rotationAnimation") // 원하는 뷰에 애니메이션 삽입

//timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCount), userInfo: nil, repeats: true) as? DispatchSourceTimer
//if timer == nil {
//    timer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
//    timer?.schedule(deadline: .now(), repeating: 1)
//    timer?.setEventHandler(handler: {
//        print(Date())
//    })
//} else {
//    timer?.schedule(deadline: .now() + .seconds(1))
//    timer?.setEventHandler {
//    }
//    timer?.activate()
//}
//self.count -= 1
//timerLabel.text = "\(count)"
//setTimer()
//if timerLabel.text == "\(0)" {
//    timer = nil
//   timer?.cancel()
//}
//print(count)
