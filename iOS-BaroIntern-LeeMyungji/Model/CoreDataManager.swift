//
//  CoreDataManager.swift
//  iOS-BaroIntern-LeeMyungji
//
//  Created by 이명지 on 3/16/25.
//

import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    
    private init() {}
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func isExistID(_ id: String) -> Bool {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let result = try context.fetch(fetchRequest)
            return !result.isEmpty
        } catch {
            print("아이디 중복 검사 오류: \(error)")
            return false
        }
    }
    
    func saveUser(_ user: UserData) -> Bool {
        let newUser = User(context: context)
        newUser.id = user.id
        newUser.password = user.password
        newUser.nickname = user.nickname
        
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
}
