//
//  TopicCollectionViewCell.swift
//  MiniGame
//
//  Created by 신민희 on 2021/04/28.
//

import UIKit
import SnapKit

class TopicCollectionViewCell: UICollectionViewCell {
    
   let topicLabel = UILabel()
    static let identifier = "TopicCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension TopicCollectionViewCell {
    func setUI() {
        contentView.addSubview(topicLabel)
        topicLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(contentView.frame.width)
            $0.height.equalTo(contentView.frame.height)
        }
    }
}
