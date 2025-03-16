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
    private let idTextField = InputTextField(keyboardType: .emailAddress)
    private let idValidationLabel = InputValidationLabel()
    private lazy var idContainerView = InputContainerView(subviews: [
        idLabel,
        idTextField
    ])
    
    // Password
    private let passwordLabel = InputTitleLabel(text: "비밀번호")
    private let passwordTextField = InputTextField(isSecured: true)
    private let passwordSecureButton = PasswordToggleButton(title: "표시")
    private let passwordValidationLabel = InputValidationLabel()
    private lazy var passwordContainerView = InputContainerView(subviews: [
        passwordLabel,
        passwordTextField,
        passwordSecureButton
    ])
    
    // Password-check
    private let passwordCheckLabel = InputTitleLabel(text: "비밀번호 확인")
    private let passwordCheckTextField = InputTextField(isSecured: true)
    private let passwordCheckSecureButton = PasswordToggleButton(title: "표시")
    private let passwordCheckValidationLabel = InputValidationLabel()
    private lazy var passwordCheckContainerView = InputContainerView(subviews: [
        passwordCheckLabel,
        passwordCheckTextField,
        passwordCheckSecureButton
    ])
    
    // Nickname
    private let nicknameLabel = InputTitleLabel(text: "닉네임")
    private let nicknameTextField = InputTextField()
    private let nicknameValidationLabel = InputValidationLabel()
    private lazy var nicknameContainerView = InputContainerView(subviews: [
        nicknameLabel,
        nicknameTextField
    ])
    
    // Sign-up button
    private let signUpButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.standard.cgColor
        button.backgroundColor = .clear
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.standard, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18)
        button.isEnabled = false
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
            nicknameValidationLabel,
            signUpButton
        ])
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    private var isValidID = false
    private var isValidPassword = false
    private var isPasswordMatched = false
    private var isValidNickname = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupDelegates()
        setupSubviews()
        setupConstraints()
        setupActions()
        setupTapGestures()
        setupBackButtonAction()
    }
    
    private func setupUI() {
        view.backgroundColor = .background
        navigationController?.navigationBar.tintColor = .standard
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
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        idTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        // Password Components
        passwordContainerView.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        passwordLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        passwordSecureButton.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        // Password-check Components
        passwordCheckContainerView.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        passwordCheckLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        passwordCheckTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.top.equalToSuperview().offset(15)
            $0.bottom.equalToSuperview().offset(-2)
        }
        
        passwordCheckSecureButton.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().offset(-12)
        }
        
        // Nickname Components
        nicknameContainerView.snp.makeConstraints {
            $0.height.equalTo(48)
        }
        
        nicknameLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(12)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
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
        
        [
            idContainerView,
            passwordContainerView,
            passwordCheckContainerView,
            nicknameContainerView
        ].forEach {
            totalStackView.setCustomSpacing(4, after: $0)
        }
    }
    
    private func setupActions() {
        passwordSecureButton.addTarget(self, action: #selector(passwordSecureModeToggle), for: .touchUpInside)
        passwordCheckSecureButton.addTarget(self, action: #selector(passwordCheckSecureModeToggle), for: .touchUpInside)
        
        idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordCheckTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        nicknameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    private func setupBackButtonAction() {
        
        let backButtonAction = UIAction { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            primaryAction: backButtonAction
        )
        
        navigationItem.leftBarButtonItem?.tintColor = .standard
    }
    
    @objc private func passwordSecureModeToggle() {
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry {
            passwordSecureButton.setTitle("표시", for: .normal)
        } else {
            passwordSecureButton.setTitle("숨김", for: .normal)
        }
    }
    
    @objc private func passwordCheckSecureModeToggle() {
        passwordCheckTextField.isSecureTextEntry.toggle()
        
        if passwordCheckTextField.isSecureTextEntry {
            passwordCheckSecureButton.setTitle("표시", for: .normal)
        } else {
            passwordCheckSecureButton.setTitle("숨김", for: .normal)
        }
    }
    
    @objc private func signUpButtonTapped() {
        guard let id = idTextField.text, !id.isEmpty,
              let password = passwordTextField.text, !password.isEmpty,
              let nickname = nicknameTextField.text, !nickname.isEmpty else {
            return
        }
        
        // 이미 존재하는 아이디
        if CoreDataManager.shared.isExistID(id) {
            showAlert(title: "회원가입 실패", message: "이미 존재하는 아이디입니다.")
            return
        }
        
        let newUser = UserData(id: id, password: password, nickname: nickname)
        
        if CoreDataManager.shared.saveUser(newUser) {
            // 로그인 성공 화면으로 이동
            navigationController?.pushViewController(LoggedInViewController(id: newUser.id), animated: true)
            // 유저디플트에 로그인 아이디 저장
            UserDefaults.standard.setValue(id, forKey: UserDefaultsKeys.loggedInID)
        } else {
            showAlert(title: "회원가입 실패", message: "사용자 등록에 실패했습니다.")
        }
    }
}

extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idLabel.font = .systemFont(ofSize: 11)
            idLabel.snp.makeConstraints {
                $0.centerY.equalToSuperview().offset(-13)
            }
        }
        
        if textField == passwordTextField {
            passwordLabel.font = .systemFont(ofSize: 11)
            passwordLabel.snp.makeConstraints {
                $0.centerY.equalToSuperview().offset(-13)
            }
        }
        
        if textField == passwordCheckTextField {
            passwordCheckLabel.font = .systemFont(ofSize: 11)
            passwordCheckLabel.snp.makeConstraints {
                $0.centerY.equalToSuperview().offset(-13)
            }
        }
        
        if textField == nicknameTextField {
            nicknameLabel.font = .systemFont(ofSize: 11)
            nicknameLabel.snp.makeConstraints {
                $0.centerY.equalToSuperview().offset(-13)
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.totalStackView.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField {
            if idTextField.text == "" {
                idLabel.font = .systemFont(ofSize: 16)
                idLabel.snp.remakeConstraints {
                    $0.centerY.equalToSuperview()
                    $0.horizontalEdges.equalToSuperview().inset(12)
                }
            }
        }
        
        if textField == passwordTextField {
            if passwordTextField.text == "" {
                passwordLabel.font = .systemFont(ofSize: 16)
                passwordLabel.snp.remakeConstraints {
                    $0.centerY.equalToSuperview()
                    $0.horizontalEdges.equalToSuperview().inset(12)
                }
            }
        }
        
        if textField == passwordCheckTextField {
            if passwordCheckTextField.text == "" {
                passwordCheckLabel.font = .systemFont(ofSize: 16)
                passwordCheckLabel.snp.remakeConstraints {
                    $0.centerY.equalToSuperview()
                    $0.horizontalEdges.equalToSuperview().inset(12)
                }
            }
        }
        
        if textField == nicknameTextField {
            if nicknameTextField.text == "" {
                nicknameLabel.font = .systemFont(ofSize: 16)
                nicknameLabel.snp.remakeConstraints {
                    $0.centerY.equalToSuperview()
                    $0.horizontalEdges.equalToSuperview().inset(12)
                }
            }
        }
        
        UIView.animate(withDuration: 0.3) {
            self.totalStackView.layoutIfNeeded()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SignUpViewController {
    private func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - 사용자 입력 데이터 유효성 검사
extension SignUpViewController {
    @objc private func textFieldDidChange(_ textField: UITextField) {
        // 첫 글자가 공백일 경우 공백 삭제
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        
        if textField == idTextField {
            validateID()
        } else if textField == passwordTextField {
            validatePassword()
            validatePasswordCheck()
        } else if textField == passwordCheckTextField {
            validatePasswordCheck()
        } else if textField == nicknameTextField {
            validateNickname()
        }
        
        updateSignUpButtonState()
    }
    
    private func validateID() {
        guard let email = idTextField.text, !email.isEmpty else {
            idValidationLabel.text = "이메일을 입력해주세요."
            idValidationLabel.textColor = .systemRed
            idContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidID = false
            return
        }
        
        // 이메일에서 아이디 부분만 분리
        let components = email.components(separatedBy: "@")
        if components.count < 2 {
            idValidationLabel.text = "올바른 이메일 형식이 아닙니다."
            idValidationLabel.textColor = .systemRed
            idContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidID = false
            return
        }
        
        let id = components[0]
        
        // 1. 글자수 검사
        if id.count < 6 || id.count > 20 {
            idValidationLabel.text = "이메일 앞부분은 6-20자 사이여야 합니다."
            idValidationLabel.textColor = .systemRed
            idContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidID = false
            return
        }
        
        // 2. 소문자, 숫자 검사
        let idRegex = "^[a-z0-9]+$"
        let idPredicate = NSPredicate(format: "SELF MATCHES %@", idRegex)
        if !idPredicate.evaluate(with: id) {
            idValidationLabel.text = "영문 소문자(a-z)와 숫자(0-9)만 허용됩니다."
            idValidationLabel.textColor = .systemRed
            idContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidID = false
            return
        }
        
        // 3. 숫자로 시작하는지 검사
        if let firstCharacter = id.first, firstCharacter.isNumber {
            idValidationLabel.text = "숫자로 시작할 수 없습니다."
            idValidationLabel.textColor = .systemRed
            idContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidID = false
            return
        }
        
        // 4. 이메일 형식에 맞는지 검사
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        let isValidFormat = emailPredicate.evaluate(with: email)
        
        if isValidFormat {
            idValidationLabel.text = ""
            idContainerView.layer.borderColor = UIColor.systemGreen.cgColor
            idContainerView.layer.borderColor = UIColor.systemGreen.cgColor
            isValidID = true
        } else {
            idValidationLabel.text = "올바른 이메일 형식이 아닙니다."
            idContainerView.layer.borderColor = UIColor.systemRed.cgColor
            idValidationLabel.textColor = .systemRed
            idContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidID = false
        }
    }
    
    private func validatePassword() {
        guard let password = passwordTextField.text, !password.isEmpty else {
            passwordValidationLabel.text = "비밀번호를 입력해주세요"
            passwordValidationLabel.textColor = .systemRed
            passwordContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidPassword = false
            return
        }
        
        if password.count < 8 {
            passwordValidationLabel.text = "8자 이상이어야 합니다."
            passwordValidationLabel.textColor = .systemRed
            passwordContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidPassword = false
            return
        }
        
        let passwordRegex = "^[A-Za-z0-9!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?]+$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        let isValidFormat = passwordPredicate.evaluate(with: password)
        
        if isValidFormat {
            passwordValidationLabel.text = ""
            passwordContainerView.layer.borderColor = UIColor.systemGreen.cgColor
            isValidPassword = true
        } else {
            passwordValidationLabel.text = "비밀번호는 영문 대소문자, 숫자, 특수문자만 가능합니다."
            passwordValidationLabel.textColor = .systemRed
            passwordContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidPassword = false
        }
    }
    
    private func validatePasswordCheck() {
        guard let password = passwordTextField.text, !password.isEmpty,
              let check = passwordCheckTextField.text, !check.isEmpty else {
            isPasswordMatched = false
            return
        }
        
        if password == check {
            passwordCheckValidationLabel.text = ""
            passwordCheckContainerView.layer.borderColor = UIColor.systemGreen.cgColor
            isPasswordMatched = true
        } else {
            passwordCheckValidationLabel.text = "비밀번호가 일치하지 않습니다."
            passwordCheckValidationLabel.textColor = .systemRed
            passwordCheckContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isPasswordMatched = false
        }
    }
    
    private func validateNickname() {
        guard let nickname = nicknameTextField.text, !nickname.isEmpty else {
            nicknameValidationLabel.text = "닉네임을 입력하세요."
            nicknameValidationLabel.textColor = .systemRed
            nicknameContainerView.layer.borderColor = UIColor.systemRed.cgColor
            isValidNickname = false
            return
        }
        
        nicknameValidationLabel.text = ""
        nicknameContainerView.layer.borderColor = UIColor.systemGreen.cgColor
        isValidNickname = true
    }
    
    private func updateSignUpButtonState() {
        if isValidID && isValidPassword && isPasswordMatched && isValidNickname {
            signUpButton.isEnabled = true
            signUpButton.backgroundColor = .systemGreen
            signUpButton.layer.borderColor = UIColor.systemGreen.cgColor
            signUpButton.setTitleColor(.white, for: .normal)
        } else {
            signUpButton.isEnabled = false
            signUpButton.backgroundColor = .clear
            signUpButton.layer.borderColor = UIColor.standard.cgColor
            signUpButton.setTitleColor(.standard, for: .normal)
        }
    }
}

extension SignUpViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default))
        present(alert, animated: true)
    }
}
