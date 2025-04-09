//
//  RouterView.swift
//  CleanerNext
//
//  Created by Ilıa Prokhorov on 08.04.2025.
//

import SwiftUI

public struct RouterView: View {
    @ObservedObject var viewModel: RouterViewModel

    public init(
        backend: Backend,
        setup: AppSetup
    ) {
        viewModel = .init(
            backend: backend,
            setup: setup
        )
    }

    public var body: some View {
        mainScreen
            .sheet(isPresented: $viewModel.isModalScreenVisible) {
                modalScreen
            }
            .fullScreenCover(isPresented: $viewModel.isFullscreenVisible) {
                fullscreenScreen
            }
            .transaction({ transaction in
                transaction.disablesAnimations = viewModel.disableTransactionAnimations
            })
            .onAppear {
                viewModel.onAppear()
            }
    }

    @ViewBuilder
    var mainScreen: some View {
        switch viewModel.mainScreen {
            case .tabs:
                TabScreen(
                    backend: viewModel.backend
                )
        }
    }

    @ViewBuilder
    var fullscreenScreen: some View {
        switch viewModel.fullscreenScreen {
            case .none:
                Text("FULLSCREEN NONE")
            case .loading:
                LoadingScreen()
        }
    }

    @ViewBuilder
    var modalScreen: some View {
        switch viewModel.modalScreen {
            case .none:
                Text("MODALSCREEN NONE")
        }
    }
}

#Preview {
    RouterView(
        backend: Backend(),
        setup: .generic
    )
}
