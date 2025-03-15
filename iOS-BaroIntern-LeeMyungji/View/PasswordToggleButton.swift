//
//  PasswordToggleButton.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/15/25.
//

import UIKit

final class PasswordToggleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .clear
        self.titleLabel?.font = .systemFont(ofSize: 16)
        self.setTitleColor(.white, for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
