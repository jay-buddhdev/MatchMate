//
//  UserListingView.swift
//  Matchmate
//
//  Created by Jay Buddhdev on 25/12/24.
//

import SwiftUI

struct UserListingView: View {
    // MARK: - Variables
    @StateObject private var viewModel = UserListingViewModel()
}

// MARK: - View
extension UserListingView {
    
    var body: some View {
        VStack {
            topView
            ScrollView {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    LazyVStack(spacing: 10) {
                        ForEach(viewModel.users.indices, id: \.self) { index in
                            UserCardView(user: $viewModel.users[index].wrappedValue, onAccept: {
                                handleAccept(user: $viewModel.users[index].wrappedValue)
                            }, onReject: {
                                handleReject(user: $viewModel.users[index].wrappedValue)
                            })
                        }
                    }
                }
            }
            .padding(.top, 20)
        }
        .onLoad {
            viewModel.isLoading = true
            viewModel.fetchUsersFromAPI()
        }
    }
}// End of extension

// MARK: - Sub Views
extension UserListingView {
    
    private var topView: some View {
        Text(AppStrings.profileMatch)
            .font(.headline)
    }
    
}// End of extension

// MARK: - Button Actions
extension UserListingView {
    
    private func handleAccept(user: UserList) {
        // TODO: Implement Latter
    }
    
    private func handleReject(user: UserList) {
        // TODO: Implement Latter
    }
    
}// End of extension

#Preview {
    UserListingView()
}
