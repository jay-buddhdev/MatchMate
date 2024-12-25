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
    let user: UserList
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
                    .frame(height: 20)
                buttonView
                Spacer()
                    .frame(height: 15)
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
    
    private var imageView: some View {
        WebImage(url: URL(string: user.picture.large))
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
            Text(user.name.first + " " + user.name.last)
                .font(.title2)
                .bold()
                .foregroundColor(Color.white.opacity(0.9))
            
            Text(AppStrings.userAge(user.dob.age))
                .font(.title3)
                .foregroundColor(Color.white)
        }
        .padding(.leading, 30)
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
    }
    
}// End of extension
