//
//  TabScreen.swift
//  Revisual
//
//  Created by Ilıa Prokhorov on 08.04.2025.
//

import SwiftUI

public struct TabScreen: View {
    @ObservedObject var viewModel: TabScreenViewModel

    @State private var path = NavigationPath()

    public init(
        backend: Backend
    ) {
        viewModel = .init(
            backend: backend
        )
    }

    public var body: some View {
        TabView {
            NavigationStack(path: $path) {
                scanOverviewScreen
                .navigationDestination(
                    for: MainTabSubScreen.self
                ) { tab in
                    switch tab {
                    case .smartScreen:
                        Text("Smart Screen")
                    }
                }
            }
            .tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }

            Text("Search View")
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }

            Text("Favorites View")
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Favorites")
                }

            Text("Settings View")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
    }
    
    private var scanOverviewScreen: some View {
        ScanOverviewScreen()
    }
}

#Preview {
    TabScreen(
        backend: Backend()
    )
}
