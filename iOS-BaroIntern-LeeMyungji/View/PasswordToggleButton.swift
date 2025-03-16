//
//  PasswordToggleButton.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/15/25.
//

import UIKit

final class PasswordToggleButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        
        self.backgroundColor = .clear
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 15)
        self.setTitleColor(.standard, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
