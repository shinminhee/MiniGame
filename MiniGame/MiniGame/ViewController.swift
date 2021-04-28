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
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }


}

extension ViewController {
    @objc
    func tap(_ sender: UIButton) {
        setTopicView()
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
    }
    final private func setBasics() {
        changeButton.setTitle("변경", for: .normal)
        changeButton.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        changeButton.backgroundColor = .systemIndigo
        topicLabel.text = ""
        topicLabel.backgroundColor = .yellow
        
    }
    final private func setLayouts() {
        view.addSubview(topicLabel)
        topicLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(view.snp.centerY).offset(-100)
            $0.width.equalTo(160)
            $0.height.equalTo(80)
        }
        view.addSubview(changeButton)
        changeButton.snp.makeConstraints {
            $0.leading.equalTo(topicLabel.snp.trailing)
            $0.top.equalTo(topicLabel.snp.top)
            $0.width.equalTo(80)
            $0.height.equalTo(80)
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
}
