//
//  SplashViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/16.
//

import UIKit

class SplashView: UIView {
    let logoImageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setLayout()
    }
    final private func setLayout() {
        setBasic()
        addSubview(logoImageView)
        backgroundColor = .black
        logoImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
    final private func setBasic() {
        let topGif = UIImage.gifImageWithName("logo")
        logoImageView.image = topGif
    }
}
