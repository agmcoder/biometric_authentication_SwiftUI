//
//  biometric_authenticationApp.swift
//  biometric_authentication
//
//  Created by agmcoder on 15/4/22.
//
//

import SwiftUI

@main
struct biometric_authenticationApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
