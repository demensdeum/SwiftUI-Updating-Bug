//
//  MockWorkUnit.swift
//  Revisual
//
//  Created by Ilıa Prokhorov on 09.04.2025.
//

class MockWorkUnit: WorkUnit, @unchecked Sendable {
    weak var delegate: WorkUnitDelegate?
    
    func start() {
        Task { [weak self] in
            try? await Task.sleep(nanoseconds: 2_000_000_000) // 2 seconds
            self?.delegate?.workUnit(nil, didRequestFullscreenScreen: .none)
        }
    }
}
