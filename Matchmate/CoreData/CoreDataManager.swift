//
//  CoreDataHelper.swift
//  Matchmate
//
//  Created by Jay Buddhdev on 26/12/24.
//
import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private init() {}
    
    // MARK: - Persistent Container
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Matchmate")
        container.loadPersistentStores { description, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    // MARK: - Managed Context
    private var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveUserToCoreData(from userList: [UserList]) -> Result<Bool, Error> {
        do {
            for user in userList {
                let userEntity = User(context: context)
                userEntity.name = "\(user.name.title) \(user.name.first) \(user.name.last)"
                userEntity.age = Int16(user.dob.age)
                userEntity.profilePictureURL = user.picture.large
                userEntity.uuid = user.login.uuid
                userEntity.isAccepted = AppStrings.none()
                userEntity.isSynced = true
            }
            try context.save()
            return .success(true)
        } catch {
            return .failure(error)
        }
    }
    
    func fetchAllUsers() -> Result<[User], Error> {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        do {
            let users = try context.fetch(fetchRequest)
            return .success(users)
        } catch {
            return .failure(error)
        }
    }
    
    func updateUserStatus(uuid: String, newStatus: String) -> Result<Bool, Error> {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid == %@", uuid)
        
        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                user.isAccepted = newStatus
                user.isSynced = false
                try context.save()
                return .success(true)
            } else {
                return .failure(NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"]))
            }
        } catch {
            return .failure(error)
        }
    }
    
    func updateUserSyncStatus(uuid: String) -> Result<Bool, Error> {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "uuid == %@", uuid)
        
        do {
            let users = try context.fetch(fetchRequest)
            if let user = users.first {
                user.isSynced = true
                try context.save()
                return .success(true)
            } else {
                return .failure(NSError(domain: "", code: 404, userInfo: [NSLocalizedDescriptionKey: "User not found"]))
            }
        } catch {
            return .failure(error)
        }
    }

}
