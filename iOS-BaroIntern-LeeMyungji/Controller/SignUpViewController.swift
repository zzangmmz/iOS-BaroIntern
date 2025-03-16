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
    private let idLabel = InputTitleLabel(text: "이메일")
    private let idTextField = InputTextField()
    private let idValidationLabel = InputValidationLabel()
    private lazy var idContainerView = InputContainerView(subviews: [
        idLabel,
        idTextField
    ])
    
    // Password
    private let passwordLabel = InputTitleLabel(text: "비밀번호")
    private let passwordTextField = InputTextField()
    private let togglePasswordButton = PasswordToggleButton()
    private let passwordValidationLabel = InputValidationLabel()
    private lazy var passwordContainerView = InputContainerView(subviews: [
        passwordLabel,
        passwordTextField,
        togglePasswordButton
    ])
    
    // Password-check
    private let passwordCheckLabel = InputTitleLabel(text: "비밀번호 확인")
    private let passwordCheckTextField = InputTextField()
    private let togglePasswordCheckButton = PasswordToggleButton()
    private let passwordCheckValidationLabel = InputValidationLabel()
    private lazy var passwordCheckContainerView = InputContainerView(subviews: [
        passwordLabel,
        passwordCheckTextField,
        togglePasswordCheckButton
    ])
    
    // Nickname
    private let nicknameLabel = InputTitleLabel(text: "닉네임")
    private let nicknameTextField = InputTextField()
    private lazy var nicknameContainerView = InputContainerView(subviews: [
        nicknameLabel,
        nicknameTextField
    ])
    
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
        
        setupDelegates()
        setupSubviews()
        setupConstraints()
    }
    
    private func setupDelegates() {
        [
            idTextField,
            passwordTextField,
            passwordCheckTextField,
            nicknameTextField
        ].forEach {
            $0.delegate = self
        }
    }
    
    private func setupSubviews() {
        view.addSubview(totalStackView)
    }
    
    private func setupConstraints() {
        totalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
}
