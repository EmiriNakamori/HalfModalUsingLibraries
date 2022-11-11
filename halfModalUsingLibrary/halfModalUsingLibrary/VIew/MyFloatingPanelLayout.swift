//
//  MyFloatingPanelLayout.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/26.
//

import FloatingPanel

class MyFloatingPanelLayout: FloatingPanelLayout {
    var basketTopViewHeight: CGFloat? = 0.0
    let position: FloatingPanelPosition = .bottom
    let initialState: FloatingPanelState = .tip

    let anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] = [
        .full: FloatingPanelLayoutAnchor(absoluteInset: 16.0, edge: .top, referenceGuide: .safeArea),
        .half: FloatingPanelLayoutAnchor(absoluteInset: 162.0, edge: .bottom, referenceGuide: .safeArea),
        .tip: FloatingPanelLayoutAnchor(absoluteInset: 82.0, edge: .bottom, referenceGuide: .superview)
    ]

}

extension MyFloatingPanelLayout: SendViewHeightDelegate {
    func sendViewHeight(height: CGFloat) {
        self.basketTopViewHeight = height
    }
}
