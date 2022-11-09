//
//  MyFloatingPanelLayout.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/26.
//

import FloatingPanel

class MyFloatingPanelLayout: FloatingPanelLayout {
    let basketTopView = BasketTopView()
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .tip


    let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
        .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
        .half: FloatingPanelLayoutAnchor(absoluteInset: 162.0, edge: .bottom, referenceGuide: .safeArea),
        .tip: FloatingPanelLayoutAnchor(absoluteInset: 82.0, edge: .bottom, referenceGuide: .safeArea),
    ]


    

}
