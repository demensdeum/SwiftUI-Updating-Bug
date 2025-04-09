//
//  TabScreenViewModel.swift
//  Revisual
//
//  Created by Ilıa Prokhorov on 08.04.2025.
//

import SwiftUI

class TabScreenViewModel: ObservableObject {
    let backend: Backend

    init(
        backend: Backend,
    ) {
        self.backend = backend
    }
}
