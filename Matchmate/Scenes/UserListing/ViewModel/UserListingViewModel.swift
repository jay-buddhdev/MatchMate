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
    @Published var users: [UserList] = []
    @Published var isLoading: Bool = false
    var fetchUserError = PassthroughSubject<String, Never>()
    var fetchUserErrorPublisher: AnyPublisher<String, Never> {
        fetchUserError.eraseToAnyPublisher()
    }
    
    // MARK: - Functions
    func fetchUsersFromAPI() {
        Task {
            do {
                let result = try await APIManager.shared.request(endpoint: "/?results=10", responseType: BaseUserListResponse.self)
                DispatchQueue.main.async { [weak self] in
                    guard let self else { return }
                    users = result.results
                    isLoading = false
                }
            }
            catch {
                isLoading = false
                fetchUserError.send(error.localizedDescription)
            }
        }
    }
}
