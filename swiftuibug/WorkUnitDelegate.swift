//
//  WorkUnitDelegate.swift
//  Revisual
//
//  Created by Ilıa Prokhorov on 09.04.2025.
//

protocol WorkUnitDelegate: AnyObject {
    func workUnit(_ workUnit: WorkUnit?, didRequestFullscreenScreen: FullscreenScreen)
}
