//
//  GameTableViewCell.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/11.
//

import UIKit
import SnapKit

class GameTableViewCell: UITableViewCell {
    
    let GameLabel = CustomGameLabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension GameTableViewCell {
    func setUI() {
        contentView.addSubview(GameLabel)
        GameLabel.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(10)
            $0.leading.trailing.equalToSuperview().inset(35)
        }
    
    }
}
