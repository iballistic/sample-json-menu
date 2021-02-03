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
            //https://developer.apple.com/documentation/swiftui/managing-model-data-in-your-app
            ContentView().environmentObject(config)
        }
    }
}
