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
        passwordCheckLabel,
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
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.gray.cgColor
        button.backgroundColor = .clear
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
        stackView.spacing = 20
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
        // ID Components
        idContainerView.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        idLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        idTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        idValidationLabel.snp.makeConstraints {
            $0.top.equalTo(idContainerView.snp.bottom).offset(4)
            $0.horizontalEdges.equalTo(idContainerView.snp.horizontalEdges)
        }
        
        // Password Components
        passwordContainerView.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        togglePasswordButton.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        passwordValidationLabel.snp.makeConstraints {
            $0.top.equalTo(passwordContainerView.snp.bottom).offset(4)
            $0.horizontalEdges.equalTo(passwordContainerView.snp.horizontalEdges)
        }
        
        // Password-check Components
        passwordCheckContainerView.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        passwordCheckLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        passwordCheckTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        togglePasswordCheckButton.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().offset(-8)
        }
        
        passwordCheckValidationLabel.snp.makeConstraints {
            $0.top.equalTo(passwordCheckContainerView.snp.bottom).offset(4)
            $0.horizontalEdges.equalTo(passwordCheckContainerView.snp.horizontalEdges)
        }
        
        // Nickname Components
        nicknameContainerView.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(8)
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(8)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        // Sign-up Button
        signUpButton.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        totalStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(30)
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    
}
