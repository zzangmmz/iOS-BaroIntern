//
//  InputTitleLabel.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/15/25.
//

import UIKit

final class InputTitleLabel: UILabel {
    init(text: String, ofSize: CGFloat = 18) {
        super.init(frame: .zero)
        
        self.text = text
        self.textColor = .white
        self.font = .systemFont(ofSize: ofSize)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
    }
}
