//
//  StartViewController.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/14/25.
//

import UIKit

private struct UserDefaultsKeys {
    static let isLoggedIn = "isLoggedIn"
}

final class StartViewController: UIViewController {
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(startButton)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        guard isLoggedIn() else {
            // 회원가입 화면으로 이동
            return
        }
        // 로그인 성공 화면으로 이동
    }
    
    private func isLoggedIn() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaultsKeys.isLoggedIn)
    }
}
