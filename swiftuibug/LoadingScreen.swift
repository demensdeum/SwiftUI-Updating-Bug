//
//  LoadingScreen.swift
//  Revisual
//
//  Created by Ilıa Prokhorov on 23.02.2025.
//

import SwiftUI

public struct LoadingScreen: View {
    @ObservedObject private var viewModel: LoadingScreenViewModel

    public init() {
        viewModel = LoadingScreenViewModel()
    }

    private var innerView: some View {
        Text("Fullscreen loader, must be closed after 2 seconds...")
    }

    public var body: some View {
        innerView
    }
}
