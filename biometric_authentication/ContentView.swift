//
//  ContentView.swift
//  biometric_authentication
//
//  Created by agmcoder on 15/4/22.
//
//

import SwiftUI
import LocalAuthentication
import CoreData

struct ContentView: View {
    @State var isUnlocked = false

    var body: some View {
        VStack {
            Text("you are \(isUnlocked ? "unlocked" : "locked")")
            Button(
                    isUnlocked == true ? "Unlock" : "Lock"
            ) {
                if (self.isUnlocked) {
                    isUnlocked.toggle()
                } else {
                    authenticateWithBiometrics()
                }


            }
            //button with rounded corners
            .padding()
            .background(Color.gray)
            .foregroundColor(.white)
            .clipShape(Capsule())

            
            
                   
        }   .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(isUnlocked ? Color.green : Color.red)


    }

    //implement a function to authenticate with biometric authentication
    func authenticateWithBiometrics() {
        let reason = "You need to authenticate"
        let laContext = LAContext()
        var error: NSError?

        if laContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            laContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, error in
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        self.isUnlocked = false
                    }
                }
            }
        } else {
            // no biometrics available
            self.isUnlocked = false
        }
    }

}
//preview content_view
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}





