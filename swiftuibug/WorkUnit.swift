//
//  WorkUnit.swift
//  Revisual
//
//  Created by Ilıa Prokhorov on 09.04.2025.
//

protocol WorkUnit {
    var delegate: WorkUnitDelegate? { get set }
    func start()
}
