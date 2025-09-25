//
//  AppDelegate.swift
//  Sample-SwiftUI (iOS)
//
//  Created by Michael McNamara on 07/09/2020.
//

import Foundation
import Intercom

class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        // Initialize Intercom - would normally initialize here - also crashes.
         Intercom.setApiKey(INTERCOM_APP_ID, forAppId: INTERCOM_API_KEY)
         Intercom.setLauncherVisible(true)

         #if DEBUG
         Intercom.enableLogging()
         #endif
        	
        Intercom.loginUnidentifiedUser();

        return true
    }
    
    // MARK: Remote Notifications
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Set device token for push notifications.
        Intercom.setDeviceToken(deviceToken) { error in
            guard let error = error else { return }
            print("Error setting device token: \(error.localizedDescription)")
        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Return the appropriate configuration for CarPlay or regular scenes
        if connectingSceneSession.role.rawValue == "CPTemplateApplicationSceneSessionRoleApplication" {
            return UISceneConfiguration(name: "CarPlay Configuration", sessionRole: connectingSceneSession.role)
        }
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
