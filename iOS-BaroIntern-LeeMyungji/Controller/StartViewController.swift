//
//  StartViewController.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/14/25.
//

import UIKit

final class StartViewController: UIViewController {
    private let startButton: UIButton = {
        let button = UIButton()
        button.setTitle("시작하기", for: .normal)
        button.setTitleColor(.standard, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 15
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.standard.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSubviews()
        setupConstraints()
        setupActions()
    }
    
    private func setupUI() {
        view.backgroundColor = .background
    }
    
    private func setupSubviews() {
        [
            startButton
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        [
            startButton
        ].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 150),
            startButton.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func setupActions() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    @objc private func startButtonTapped() {
        guard let id = isLoggedIn() else {
            // 회원가입 화면으로 이동
            navigationController?.pushViewController(SignUpViewController(), animated: true)
            return
        }
        // 로그인 화면으로 이동
        navigationController?.pushViewController(LoggedInViewController(id: id), animated: true)
    }
    
    private func isLoggedIn() -> String? {
        return UserDefaults.standard.string(forKey: UserDefaultsKeys.loggedInID)
    }
}
