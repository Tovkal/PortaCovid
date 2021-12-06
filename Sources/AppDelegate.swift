//
//  AppDelegate.swift
//  PortaCovidUITests
//
//  Created by Andrés Pizá Bückmann on 6/12/21.
//

import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        #if DEBUG
        if CommandLine.arguments.contains("-noQR") {
            UIView.setAnimationsEnabled(false)
            DataStore.shared.deleteCertificate()
        }
        
        if CommandLine.arguments.contains("-preloadQR") {
            UIView.setAnimationsEnabled(false)
            DataStore.shared.preload()
        }
        #endif
        return true
    }
}
