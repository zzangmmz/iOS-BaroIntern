//
//  InputTextField.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/15/25.
//

import UIKit

final class InputTextField: UITextField {
    init(ofSize: CGFloat = 18, isSecured: Bool = false) {
        super.init(frame: .zero)
        
        self.borderStyle = .none
        self.backgroundColor = .clear
        self.font = .systemFont(ofSize: ofSize)
        self.isSecureTextEntry = isSecured
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
