//
//  InputValidationLabel.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/15/25.
//

import UIKit

final class InputValidationLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.textColor = .red
        self.font = .systemFont(ofSize: 11)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
