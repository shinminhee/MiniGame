//
//  PersonCollectionViewCell.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/04.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    let personName = UILabel()
    let scoreNumber = UILabel()
    static let identifier = "PersonCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

extension PersonCollectionViewCell {
    func setUI() {
        contentView.addSubview(personName)
        personName.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview().inset(5)
            $0.height.equalTo(30)
        }
        contentView.addSubview(scoreNumber)
        scoreNumber.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview().inset(5)
            $0.top.equalTo(personName.snp.bottom)
        }
        personName.backgroundColor = .white
        scoreNumber.backgroundColor = .blue
        
    }
}
