//
//  swiftuibugApp.swift
//  swiftuibug
//
//  Created by Ilıa Prokhorov on 09.04.2025.
//

import SwiftUI

public class Backend {
    public init() {}
}

@main
struct swiftuibugApp: App {
    //@Environment(\.scenePhase) var scenePhase // <--- uncomment for bug
    
    let backend = Backend()
    
    var body: some Scene {
        WindowGroup {
            RouterView(
                backend: backend,
                setup: .generic
            )
        }
    }
}
