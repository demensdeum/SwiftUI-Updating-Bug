//
//  RouterViewModel.swift
//  CleanerNext
//
//  Created by Ilıa Prokhorov on 08.04.2025.
//

import SwiftUI

class RouterViewModel: ObservableObject, @unchecked Sendable {
    let backend: Backend

    @Published private(set) var fullscreenScreen: FullscreenScreen {
        didSet {
            updateFullscreenVisibility()
        }
    }
    @Published var isFullscreenVisible: Bool

    @Published private(set) var modalScreen: ModalScreen {
        didSet {
            updateModalScreenVisibility()
        }
    }
    @Published var isModalScreenVisible: Bool

    @Published private(set) var mainScreen: MainScreen

    public private(set) var disableTransactionAnimations = true
    
    private var isStarted = false
    
    private var startWorkUnit: WorkUnit
    
    init(
        backend: Backend,
        setup: AppSetup
    ) {
        self.backend = backend

        var fullscreenScreen: FullscreenScreen
        var modalScreen: ModalScreen
        var mainScreen: MainScreen

        switch setup {
            case .generic:
                fullscreenScreen = .loading
                modalScreen = .none
                mainScreen = .tabs
                startWorkUnit = MockWorkUnit()
        }

        self.fullscreenScreen = fullscreenScreen
        self.modalScreen = modalScreen
        self.mainScreen = mainScreen

        isFullscreenVisible = fullscreenScreen != .none
        isModalScreenVisible = modalScreen != .none
    }

    private func updateFullscreenVisibility() {
        isFullscreenVisible = false
        debugPrint("isFullscreenVisible: \(isFullscreenVisible)")
    }

    private func updateModalScreenVisibility() {
        isModalScreenVisible = modalScreen != .none
    }
    
    func onAppear() {
        guard isStarted == false else { return }
        isStarted = true
        
        startWorkUnit.delegate = self
        startWorkUnit.start()
    }
}

extension RouterViewModel: WorkUnitDelegate {
    func workUnit(_ workUnit: (any WorkUnit)?, didRequestFullscreenScreen fullscreenScreen: FullscreenScreen) {
        Task { @MainActor in
            self.fullscreenScreen = fullscreenScreen
        }
    }
}
