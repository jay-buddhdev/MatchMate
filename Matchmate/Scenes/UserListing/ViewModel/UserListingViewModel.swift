//
//  UserListingViewModel.swift
//  Matchmate
//
//  Created by Jay Buddhdev on 25/12/24.
//

import Combine
import Foundation

class UserListingViewModel: ObservableObject {
    
    // MARK: - Variables
    @Published var users: [User] = []
    @Published var isLoading: Bool = false
    var fetchUserError = PassthroughSubject<String, Never>()
    var fetchUserErrorPublisher: AnyPublisher<String, Never> {
        fetchUserError.eraseToAnyPublisher()
    }
    var userUpdateError = PassthroughSubject<String, Never>()
    var userUpdateErrorPublisher: AnyPublisher<String, Never> {
        userUpdateError.eraseToAnyPublisher()
    }
    
    // MARK: - Functions
    func fetchUsersFromAPI() {
        Task {
            do {
                let result = try await APIManager.shared.request(endpoint: "/?results=10", responseType: BaseUserListResponse.self)
                saveUserToCoreData(result.results)
            }
            catch {
                isLoading = false
                fetchUserError.send(error.localizedDescription)
            }
        }
    }
    
    // MARK: - Functions
    func saveUserToCoreData(_ user: [UserList]) {
        let result = CoreDataManager.shared.saveUserToCoreData(from: user)
        switch result {
        case .success(_):
            fetchUsers()
        case .failure(let error):
            fetchUserError.send(error.localizedDescription)
        }
    }
    
    func fetchUsers() {
        let result = CoreDataManager.shared.fetchAllUsers()
        switch result {
        case .success(let users):
            if users.isEmpty {
                fetchUsersFromAPI()
            } else {
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    self.users = users
                    isLoading = false
                }
            }
        case .failure(let error):
            fetchUserError.send(error.localizedDescription)
        }
    }
    
    func updateUser(userUUID: String, status: String) {
        let result = CoreDataManager.shared.updateUserStatus(uuid: userUUID, newStatus: status)
        switch result {
        case .success:
            if let index = users.firstIndex(where: { $0.uuid == userUUID }) {
                users[index].isAccepted = status
                users = users.map { $0 }
            }
            updateUserSyncStatus(userUUID: userUUID, status: status)
        case .failure(let error):
            userUpdateError.send(error.localizedDescription)
        }
    }
    
    func updateUserSyncStatus(userUUID: String, status: String) {
        Task {
            do {
                // TODO: replace endPoint and responseMode with updateData endpoint and response Model
                let result = try await APIManager.shared.request(endpoint: "", method: .post, responseType: BaseUserListResponse.self)
                updateUserSyncCoreDataStatus(userUUID: userUUID)
            }
            catch {
                // TODO: Error Handling
            }
        }
    }
    
    func updateUserSyncCoreDataStatus(userUUID: String) {
        let result = CoreDataManager.shared.updateUserSyncStatus(uuid: userUUID)
        switch result {
        case .success:
            break
        case .failure(let error):
            userUpdateError.send(error.localizedDescription)
        }
        
    }
}
