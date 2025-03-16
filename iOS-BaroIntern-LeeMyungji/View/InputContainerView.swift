//
//  InputContainerView.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/15/25.
//

import UIKit

final class InputContainerView: UIView {
    init(subviews: [UIView]) {
        super.init(frame: .zero)
        
        subviews.forEach { [weak self] in
            self?.addSubview($0)
        }
        
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
