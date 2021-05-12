//
//  KoreanQuizViewControllerTwo.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/11.
//

import UIKit


class KoreanQuizViewControllerTwo: UIViewController {
    
    let koreanLabel = UILabel()
    let mainLogo = UIImageView()
    let startButton = CustomStartButton()
    let nextButton = CustomStartButton()
    let KoreanCollectionViewLayout = UICollectionViewFlowLayout()
    lazy var KoreanCollectionView = UICollectionView(frame: .zero, collectionViewLayout: KoreanCollectionViewLayout)
    let paperLabel = UILabel()
    let colors: [UIColor] = [UIColor(displayP3Red: 9/255, green: 132/255, blue: 227/255, alpha: 1), UIColor(displayP3Red: 255/255, green: 118/255, blue: 117/255, alpha: 1), UIColor(displayP3Red: 0/255, green: 206/255, blue: 201/255, alpha: 1), UIColor(displayP3Red: 253/255, green: 203/255, blue: 110/255, alpha: 1)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setUI()
    }
}

extension KoreanQuizViewControllerTwo {
    @objc
    func startButton(_ sender: UIButton) {
        let arraynum: Int = Korean.shared.first.count // 메시지 배열의 요소 개수를 세서 arraynum 변수에 할당
        let firstNumbers = Int.random(in: 0 ..< arraynum) // 랜덤으로 수를 골라 numbers 변수에 할당
        let firstMessage = Korean.shared.first[firstNumbers]
        let secondNumbers = Int.random(in: 0 ..< arraynum)
        let secondMessage = Korean.shared.first[secondNumbers]
        koreanLabel.text = "\(firstMessage) \(secondMessage)"
        paperLabel.isHidden = false
        nextButton.isHidden = false
        self.paperLabel.backgroundColor = .white

//        self.paperLabel.backgroundColor = colors[UIColor].randomElement()
        self.paperLabel.text = "종이를 넘겨주세요"
        paperLabel.isHidden = false
    }
    @objc
    func nextButton(_ sender: UIButton) {
        let arraynum: Int = Korean.shared.first.count // 메시지 배열의 요소 개수를 세서 arraynum 변수에 할당
        let firstNumbers = Int.random(in: 0 ..< arraynum) // 랜덤으로 수를 골라 numbers 변수에 할당
        let firstMessage = Korean.shared.first[firstNumbers]
        let secondNumbers = Int.random(in: 0 ..< arraynum)
        let secondMessage = Korean.shared.first[secondNumbers]
        koreanLabel.text = "\(firstMessage) \(secondMessage)"
        self.paperLabel.backgroundColor = .white
        self.paperLabel.text = "종이를 넘겨주세요"
        paperLabel.isHidden = false
    }
    
    @objc
    func paperLabelTaped(_ sender: UITapGestureRecognizer) {
        UIView.transition(with: self.paperLabel, duration: 1, options: .transitionCurlUp, animations: {
            self.paperLabel.backgroundColor = .clear
            self.paperLabel.text = ""
        }, completion: nil)
    }
}

extension KoreanQuizViewControllerTwo {
    final private func setUI() {
        setBasics()
        setLayouts()
    }
    
    final private func setBasics() {
        
        mainLogo.image = UIImage(named: "KoreanQuiz")
        koreanLabel.backgroundColor = .black
        koreanLabel.layer.borderColor = UIColor.yellow.cgColor
        koreanLabel.layer.borderWidth = 3
        koreanLabel.textAlignment = .center
        koreanLabel.textColor = .white
        koreanLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)

      
        startButton.setTitle("시작하기", for: .normal)
        startButton.addTarget(self, action: #selector(startButton(_:)), for: .touchUpInside)
        startButton.layer.borderColor = UIColor.green.cgColor
        
        paperLabel.textColor = .black
        paperLabel.textAlignment = .center
        paperLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        paperLabel.isHidden = true
        let paperLabelTaped = UITapGestureRecognizer(target: self, action: #selector(paperLabelTaped(_:)))
        paperLabelTaped.numberOfTouchesRequired = 1
        paperLabelTaped.numberOfTapsRequired = 1
        paperLabel.addGestureRecognizer(paperLabelTaped)
        paperLabel.isUserInteractionEnabled = true
        
        nextButton.setTitle("다음문제", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButton(_:)), for: .touchUpInside)
        nextButton.layer.borderColor = UIColor.systemPink.cgColor
    }
    
    final private func setLayouts() {
        view.addSubview(mainLogo)
        mainLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaInsets.top).inset(10)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(240)
        }
        view.addSubview(koreanLabel)
        koreanLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(200)
        }
        view.addSubview(paperLabel)
        paperLabel.snp.makeConstraints {
            $0.leading.trailing.top.bottom.equalTo(koreanLabel).inset(5)
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
    final private func setPaper() {
        
    }
}
