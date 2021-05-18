//
//  KoreanCollectionViewCell.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/08.
//

import UIKit

class KoreanCollectionViewCell: UICollectionViewCell {
    static let identifier = "KoreanCollectionViewCell"
    let koreanLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension KoreanCollectionViewCell {
    func setUI() {
        contentView.addSubview(koreanLabel)
        koreanLabel.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(contentView.frame.width)
            $0.height.equalTo(contentView.frame.height)
        }
    }
}
