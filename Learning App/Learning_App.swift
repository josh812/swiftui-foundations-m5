//
//  Learning_AppApp.swift
//  Learning App
//
//  Created by J M on 2/9/22.
//

import SwiftUI

@main
struct Learning_App: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
