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
    
    // 현재 로그인한 사용자
    private var currentUser: User?
    
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
    
    // 회원가입 메서드
    func saveUser(_ user: UserData) -> Bool {
        let newUser = User(context: context)
        newUser.id = user.id
        newUser.password = user.password
        newUser.nickname = user.nickname
        
        do {
            try context.save()
            // 사용자 로그인
            currentUser = newUser
            return true
        } catch {
            return false
        }
    }
    
    // 현재 로그인한 사용자 정보 가져오는 메서드
    func getCurrentUser() -> UserData? {
        guard let id = currentUser?.id, let nickname = currentUser?.nickname else {
            return nil
        }
        return UserData(id: id, password: "", nickname: nickname)
    }
    
    // 사용자 로그인 메서드
    func login(id: String) -> UserData? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let result = try context.fetch(fetchRequest)
            self.currentUser = result.first
            return self.getCurrentUser()
        } catch {
            print("사용자 조회 오류: \(error)")
            return nil
        }
    }
    
    // 로그아웃 메서드
    func logout() {
        currentUser = nil
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.loggedInID)
    }
    
    // 회원탈퇴 메서드
    func deleteUser() {
        guard let currentUser = currentUser,
              let id = currentUser.id else {
            print("회원탈퇴 오류: 로그인된 사용자가 없음.")
            return
        }
        
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id)
        
        do {
            let result = try context.fetch(fetchRequest)
            if let userToDelete = result.first {
                context.delete(userToDelete)
                try context.save()
                self.logout()
                print("회원탈퇴 성공")
            }
        } catch {
            print("회원탈퇴 오류: \(error)")
        }
    }
}
