//
//  PortaCovidApp.swift
//  PortaCovid
//
//  Created by Andrés Pizá Bückmann on 1/12/21.
//

import SwiftUI

@main
struct PortaCovidApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
