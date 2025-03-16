//
//  SignUpViewController.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/14/25.
//

import UIKit
import SnapKit

final class SignUpViewController: UIViewController {
    // MARK: - UI Components
    // ID
    private let idContainerView = InputContainerView()
    private let idLabel = InputTitleLabel(text: "이메일")
    private let idTextField = InputTextField()
    private let idValidationLabel = InputValidationLabel()
    
    // Password
    private let passwordContainerView = InputContainerView()
    private let passwordLabel = InputTitleLabel(text: "비밀번호")
    private let passwordTextField = InputTextField()
    private let togglePasswordButton = PasswordToggleButton()
    private let passwordValidationLabel = InputValidationLabel()
    
    // Password-check
    private let passwordCheckContainerView = InputContainerView()
    private let passwordCheckLabel = InputTitleLabel(text: "비밀번호 확인")
    private let passwordCheckTextField = InputTextField()
    private let togglePasswordCheckButton = PasswordToggleButton()
    private let passwordCheckValidationLabel = InputValidationLabel()
    
    // Nickname
    private let nicknameContainerView = InputContainerView()
    private let nicknameLabel = InputTitleLabel(text: "닉네임")
    private let nicknameTextField = InputTextField()
    
    // Sign-up button
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()
    
    private lazy var totalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            idContainerView,
            idValidationLabel,
            passwordContainerView,
            passwordValidationLabel,
            passwordCheckContainerView,
            passwordCheckValidationLabel,
            nicknameContainerView,
            signUpButton
        ])
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        setupConstraints()
    }
    
    private func setupSubviews() {
        // ID ContainerView
        [
            idLabel,
            idTextField
        ].forEach {
            idContainerView.addSubview($0)
        }
        
        // Password ContainerView
        [
            passwordLabel,
            passwordTextField,
            togglePasswordButton
        ].forEach {
            passwordContainerView.addSubview($0)
        }
        
        // Password-check ContainerView
        [
            passwordCheckLabel,
            passwordCheckTextField,
            togglePasswordCheckButton
        ].forEach {
            passwordCheckContainerView.addSubview($0)
        }
        
        // Nickname ContainerView
        [
            nicknameLabel,
            nicknameTextField
        ].forEach {
            nicknameContainerView.addSubview($0)
        }
        
        view.addSubview(totalStackView)
    }
    
    private func setupConstraints() {
        totalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
