//
//  LoggedInViewController.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/16/25.
//

import UIKit

final class LoggedInViewController: UIViewController {
    private var user: UserData?
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .standard
        return label
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "환영합니다."
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .standard
        return label
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(.standard, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor.standard.cgColor
        return button
    }()
    
    private let deleteAccountButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원탈퇴", for: .normal)
        button.setTitleColor(.standard, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor.standard.cgColor
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            logoutButton,
            deleteAccountButton
        ])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        return stackView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            nicknameLabel,
            welcomeLabel
        ])
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    init(id: String) {
        self.user = CoreDataManager.shared.login(id: id)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupSubviews()
        setupConstraints()
        setupActions()
        setupBackButtonAction()
    }
    
    private func setupUI() {
        view.backgroundColor = .background
        
        if let nickname = user?.nickname {
            nicknameLabel.text = "\(nickname) 님"
        } else {
            nicknameLabel.text = "사용자 님"
        }
    }
    
    private func setupSubviews() {
        [
            labelStackView,
            buttonStackView
        ].forEach {
            view.addSubview($0)
        }
    }
    
    private func setupConstraints() {
        labelStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.horizontalEdges.equalToSuperview().inset(30)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            $0.width.equalTo(120)
        }
    }
    
    private func setupActions() {
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        deleteAccountButton.addTarget(self, action: #selector(deleteAccountButtonTapped), for: .touchUpInside)
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
    
    @objc private func logoutButtonTapped() {
        showAlert(title: "로그아웃 하시겠습니까?") { [weak self] in
            CoreDataManager.shared.logout()
            self?.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    @objc private func deleteAccountButtonTapped() {
        showAlert(title: "탈퇴하시겠습니까?") { [weak self] in
            CoreDataManager.shared.deleteUser()
            self?.navigationController?.popToRootViewController(animated: true)
        }
    }
}

extension LoggedInViewController {
    private func showAlert(title: String, completion: @escaping () -> ()) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .destructive) { _ in
            completion()
        })
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        present(alert, animated: true)
    }
}
