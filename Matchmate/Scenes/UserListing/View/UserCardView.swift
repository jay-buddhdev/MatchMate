//
//  UserCardView.swift
//  Matchmate
//
//  Created by Jay Buddhdev on 25/12/24.
//
import SwiftUI
import SDWebImageSwiftUI

struct UserCardView: View {
    
    // MARK: - Variables
    let user: User
    let onAccept: () -> Void
    let onReject: () -> Void
}

// MARK: - View
extension UserCardView {
    
    var body: some View {
        ZStack {
            imageView
            VStack(alignment: .leading) {
                Spacer()
                nameView
                Spacer()
                    .frame(height: 10)
                checkStatus
            }
        }
        .frame(width: 350, height: 400)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}// End of extension

// MARK: - Sub Views
extension UserCardView {
    
    @ViewBuilder
    private var checkStatus: some View {
        if user.isAccepted == AppStrings.none() {
            buttonView
        } else {
            acceptedStatusView
        }
    }
    
    private var imageView: some View {
        WebImage(url: URL(string: user.profilePictureURL ?? ""))
            .resizable()
            .scaledToFill()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .clipped()
            .shadow(radius: 10)
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.7), Color.clear]),
                    startPoint: .bottom,
                    endPoint: .top
                )
            )
    }
    
    private var nameView: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(user.name ?? "")
                .font(.title2)
                .bold()
                .foregroundColor(Color.white.opacity(0.9))
            
            Text(AppStrings.userAge(Int(user.age)))
                .font(.title3)
                .foregroundColor(Color.white)
            Spacer()
                .frame(height: 15)
        }
        .padding(.leading, 40)
    }
    
    private var buttonView: some View {
        HStack {
            Button(action: onReject) {
                Image(AppImages.rejectIcon)
                    .resizable()
                    .frame(width: 60, height: 60)
            }
            Spacer()
            Button(action: onAccept) {
                Image(AppImages.acceptIcon)
                    .resizable()
                    .frame(width: 60, height: 60)
            }
        }
        .padding(.horizontal, 50)
        .padding(.vertical, 15)
    }
    
    private var acceptedStatusView: some View {
        HStack {
            Spacer()
            Text(user.isAccepted == AppStrings.accepted() ? AppStrings.accepted : AppStrings.rejected)
                .font(.title3)
                .bold()
                .foregroundColor(Color.white)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            user.isAccepted == AppStrings.accepted() ? Color.green.opacity(0.7) : Color.red.opacity(0.7),
                            Color.clear
                        ]),
                        startPoint: .bottom,
                        endPoint: .top
                    )
                    .cornerRadius(12)
                )
            Spacer()
        }
    }
    
}// End of extension
