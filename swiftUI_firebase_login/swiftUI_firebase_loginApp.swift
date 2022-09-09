//
//  swiftUI_firebase_loginApp.swift
//  swiftUI_firebase_login
//
//  Created by Maxim Mitin on 9.09.22.
//

import SwiftUI
import Firebase

@main
struct swiftUI_firebase_loginApp: App {
    @StateObject var dataManager = DataManager()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(dataManager)
        }
    }
}
