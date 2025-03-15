//
//  SignUpViewController.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/14/25.
//

import UIKit

final class SignUpViewController: UIViewController {
    // MARK: - UI Components
    // ID
    private let idContainerView = InputContainerView()
    private let idLabel = InputTitleLabel(text: "이메일")
    private let idTextField = InputTextField()
    private let idValidationLabel = InputValidationLabel()
    
    // password
    private let passwordContainerView = InputContainerView()
    private let passwordLabel = InputTitleLabel(text: "비밀번호")
    private let passwordTextField = InputTextField()
    private let togglePasswordButton = PasswordToggleButton()
    private let passwordValidationLabel = InputValidationLabel()
    
    // password-check
    private let passwordCheckContainerView = InputContainerView()
    private let passwordCheckLabel = InputTitleLabel(text: "비밀번호 확인")
    private let passwordCheckTextField = InputTextField()
    private let togglePasswordCheckButton = PasswordToggleButton()
    private let passwordCheckValidationLabel = InputValidationLabel()
    
    // nickname
    private let nicknameContainerView = InputContainerView()
    private let nicknameLabel = InputTitleLabel(text: "닉네임")
    private let nicknameTextField = InputTextField()
    
    // sign-up button
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        [
            idLabel,
            idTextField
        ].forEach {
            idContainerView.addSubview($0)
        }
        
        [
            passwordLabel,
            passwordTextField,
            togglePasswordButton
        ].forEach {
            passwordContainerView.addSubview($0)
        }
        
        [
            passwordCheckLabel,
            passwordCheckTextField,
            togglePasswordCheckButton
        ].forEach {
            passwordCheckContainerView.addSubview($0)
        }
        
        [
            nicknameLabel,
            nicknameTextField
        ].forEach {
            nicknameContainerView.addSubview($0)
        }
        
        [
            idContainerView,
            idValidationLabel,
            passwordContainerView,
            passwordValidationLabel,
            passwordCheckContainerView,
            passwordCheckValidationLabel,
            nicknameContainerView,
            signUpButton
        ].forEach {
            view.addSubview($0)
        }
    }
}
