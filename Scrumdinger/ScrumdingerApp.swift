//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by connor dillon on 01/11/2022.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ScrumsView(scrums: DailyScrum.sampleData)
            }
        }
    }
}
