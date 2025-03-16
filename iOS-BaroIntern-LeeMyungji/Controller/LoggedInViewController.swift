//
//  LoggedInViewController.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/16/25.
//

import UIKit

final class LoggedInViewController: UIViewController {
    private var user: UserData?
    
    init(id: String) {
        super.init(nibName: nil, bundle: nil)
        
        guard let user = CoreDataManager.shared.login(id: id) else {
            UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.loggedInID)
            navigationController?.popViewController(animated: true)
            return
        }
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
