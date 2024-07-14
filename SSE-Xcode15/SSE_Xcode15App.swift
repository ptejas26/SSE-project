//
//  SSE_Xcode15App.swift
//  SSE-Xcode15
//
//  Created by Tejas Patelia on 2024-06-16.
//

import SwiftUI
//import SwiftData

@main
struct SSE_Xcode15App: App {
//    var sharedModelContainer: ModelContainer = {
//        if #available(iOS 17, *) {
//            let schema = Schema([
//                Item.self,
//            ])
//        } else {
//                // Fallback on earlier versions
//        }
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
//        .modelContainer(sharedModelContainer)
    }
}
