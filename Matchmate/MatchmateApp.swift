//
//  matchmateApp.swift
//  matchmate
//
//  Created by Jay Buddhdev on 25/12/24.
//

import SwiftUI

@main
struct MatchmateApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            UserListingView()
        }
    }
}
