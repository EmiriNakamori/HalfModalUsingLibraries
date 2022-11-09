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
    let basketVC = BasketViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        fpc.delegate = self
        fpc.set(contentViewController: basketVC)
        fpc.addPanel(toParent: self)

        fpc.surfaceView.grabberHandleSize = .init(width: 30.0, height: 4.0)
        fpc.layout = MyFloatingPanelLayout()
        fpc.invalidateLayout()

        let appearance = SurfaceAppearance()
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = .black
        shadow.offset = CGSize(width: 0, height: 1.0)
        shadow.radius = 6

        shadow.opacity = 1.0
        appearance.shadows = [shadow]

        appearance.cornerRadius = 12.0
        appearance.backgroundColor = .clear

        fpc.surfaceView.appearance = appearance

    }

    func moveHalfModal() {
        fpc.move(to: .half, animated: true)
    }

    @IBAction func tappedButton(_ sender: Any) {
        moveHalfModal()
    }

    @IBAction func tappedMedicineA(_ sender: Any) {

        let medicineA = BasketMedicine(id: "1", medicineName: "頭痛薬A")
        basketVC.addMedicine(medicine: medicineA)
        moveHalfModal()
    }

    @IBAction func tappedMedicineB(_ sender: Any) {
        let medicineB = BasketMedicine(id: "2", medicineName: "頭痛薬B")
        basketVC.addMedicine(medicine: medicineB)
        moveHalfModal()
    }

    @IBAction func tappedMedicineC(_ sender: Any) {
        let medicineC = BasketMedicine(id: "3", medicineName: "頭痛薬C")
        basketVC.addMedicine(medicine: medicineC)
        moveHalfModal()
    }




}

extension ViewController: FloatingPanelControllerDelegate {
    func floatingPanel(_ fpc: FloatingPanelController, layoutFor newCollection: UITraitCollection) -> FloatingPanelLayout {
        return MyFloatingPanelLayout()
    }
}

extension ViewController: TappedOkButtonDelegate {
    func tappedOkButton() {
        // 痛み記録画面に遷移するコード書くよ
        // 痛み記録画面にバスケットの中身の薬のデータ（例：drugNames = [頭痛薬A,頭痛薬B]）を送っておくよ
    }
}

