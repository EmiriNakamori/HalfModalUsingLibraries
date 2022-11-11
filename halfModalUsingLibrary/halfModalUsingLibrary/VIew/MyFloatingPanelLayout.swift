//
//  MyFloatingPanelLayout.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/26.
//

import FloatingPanel

class MyFloatingPanelLayout: FloatingPanelLayout {
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .tip

    let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
        .half: FloatingPanelLayoutAnchor(absoluteInset: 162.0, edge: .bottom, referenceGuide: .safeArea),
        .tip: FloatingPanelLayoutAnchor(absoluteInset: 82.0, edge: .bottom, referenceGuide: .superview)
    ]

}
