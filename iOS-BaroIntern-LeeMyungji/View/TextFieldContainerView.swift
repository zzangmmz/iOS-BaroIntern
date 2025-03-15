//
//  TextFieldContainerView.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/15/25.
//

import UIKit

final class TextFieldContainerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.backgroundColor = .gray
        self.layer.cornerRadius = 8
    }
}
