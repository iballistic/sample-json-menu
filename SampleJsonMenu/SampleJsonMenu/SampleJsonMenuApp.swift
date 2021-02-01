//
//  SampleJsonMenuApp.swift
//  SampleJsonMenu
//
//  Created by Telman Rustam on 2021-01-29.
//

import SwiftUI

@main
struct SampleJsonMenuApp: App {
    var body: some Scene {
        WindowGroup {
            let config = AppConfigJson()
            ContentView().environmentObject(config)
        }
    }
}
