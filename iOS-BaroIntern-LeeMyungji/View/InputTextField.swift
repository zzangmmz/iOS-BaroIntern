//
//  InputTextField.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/15/25.
//

import UIKit

final class InputTextField: UITextField {
    init(ofSize: CGFloat = 16, isSecured: Bool = false, keyboardType: UIKeyboardType = .default) {
        super.init(frame: .zero)
        
        self.textColor = .standard
        self.borderStyle = .none
        self.backgroundColor = .clear
        self.font = .systemFont(ofSize: ofSize)
        self.isSecureTextEntry = isSecured
        self.autocapitalizationType = .none
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.keyboardType = keyboardType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
