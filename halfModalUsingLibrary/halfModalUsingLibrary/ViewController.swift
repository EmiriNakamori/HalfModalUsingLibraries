//
//  ViewController.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/26.
//

import UIKit
import FloatingPanel

class ViewController: UIViewController {

    var fpc = FloatingPanelController()

    override func viewDidLoad() {
        super.viewDidLoad()

        fpc.delegate = self
        let basketVC = BasketViewController()
        fpc.set(contentViewController: basketVC)
        fpc.addPanel(toParent: self)

        fpc.surfaceView.grabberHandleSize = .init(width: 30.0, height: 4.0)

        fpc.layout = MyFloatingPanelLayout()
        fpc.invalidateLayout()
    }

    @IBAction func tappedButton(_ sender: Any) {

    }


}

extension ViewController: FloatingPanelControllerDelegate {
    func floatingPanel(_ fpc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout {
        return MyFloatingPanelLayout()
    }
}

