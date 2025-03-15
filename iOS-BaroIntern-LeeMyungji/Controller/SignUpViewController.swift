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
    
    private let idTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = .systemFont(ofSize: 18)
        return textField
    }()
    
    private let idValidationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    // password
    private let passwordContainerView = InputContainerView()
    private let passwordLabel = InputTitleLabel(text: "비밀번호")
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = .systemFont(ofSize: 18)
        return textField
    }()
    
    private let togglePasswordButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let passwordValidationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    // password-check
    private let passwordCheckContainerView = InputContainerView()
    private let passwordCheckLabel = InputTitleLabel(text: "비밀번호 확인")
    
    private let passwordCheckTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = .systemFont(ofSize: 18)
        return textField
    }()
    
    private let togglePasswordCheckButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    private let passwordCheckValidationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .red
        label.font = .systemFont(ofSize: 11)
        return label
    }()
    
    // nickname
    private let nicknameContainerView = InputContainerView()
    private let nicknameLabel = InputTitleLabel(text: "닉네임")
    
    private let nicknameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.backgroundColor = .clear
        textField.font = .systemFont(ofSize: 18)
        return textField
    }()
    
    // sign-up button
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()
}
