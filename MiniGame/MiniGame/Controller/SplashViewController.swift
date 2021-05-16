//
//  SplashViewController.swift
//  MiniGame
//
//  Created by 신민희 on 2021/05/16.
//

import UIKit

class SplashViewController: UIViewController {
    let logoImageView = UIImageView()

    override func viewDidLoad() {
            super.viewDidLoad()
            Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.splashTimeOut(sender:)), userInfo: nil, repeats: false)
        setUI()
        view.backgroundColor = .black
        
    }

    @objc
    func splashTimeOut(sender : Timer){
//        AppDelegate.sharedInstance().window?.rootViewController = SplashViewController()
        }

}

extension SplashViewController {
    final private func setUI() {
        setLayout()
        setBasic()
        setImageView()
    }
    final private func setLayout() {
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(250)
        }
    }
    final private func setBasic() {
        logoImageView.image = UIImage(named: "TopLogo")
    }
    final private func setImageView() {
        
    }
}
