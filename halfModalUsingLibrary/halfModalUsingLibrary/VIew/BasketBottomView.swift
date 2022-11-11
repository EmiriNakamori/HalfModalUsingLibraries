//
//  BasketBottomView.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/31.
//

import UIKit

protocol TappedOkButtonDelegate: AnyObject {
    func tappedOkButton()
}

protocol MoveFloatingPanelDelegate: AnyObject {
    func moveDownPanel()
    func controlPanel()
}

final class BasketBottomView: NibView {

    @IBOutlet weak var medicineImageView: UIImageView!
    @IBOutlet weak var medicineSetNameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!

    weak var delegateTappedOkButton: TappedOkButtonDelegate?
    weak var delegateMoveFloatingPanel: MoveFloatingPanelDelegate?

    var basketMedicines: [BasketMedicine] = [] {
        didSet {
            refreshView()
        }
    }

    @IBAction func tappedOkButton(_ sender: Any) {
        delegateTappedOkButton?.tappedOkButton()
    }

    func refreshView() {
        chengeMedicineIconAndMedicineSetName(basketMedicines: basketMedicines)
    }

    func chengeMedicineIconAndMedicineSetName(basketMedicines: [BasketMedicine]) {
        if basketMedicines.count == 0 {
//            hideAllIcon()
            delegateMoveFloatingPanel?.moveDownPanel()
            delegateMoveFloatingPanel?.controlPanel()
        } else if basketMedicines.count == 1 {
            showAllIcon()
            medicineImageView.image = UIImage(named: "medicine1")
            medicineSetNameLabel.text = basketMedicines[0].medicineName
        } else {
            showAllIcon()
            medicineImageView.image = UIImage(named: "inp_icon_drug_multi_16")
            medicineSetNameLabel.text = "現在時刻"
        }

    }

    private func hideAllIcon() {
        view.backgroundColor = .white
        medicineImageView.isHidden = true
        medicineSetNameLabel.isHidden = true
        editButton.isHidden = true
        favoriteButton.isHidden = true
    }

    private func showAllIcon() {
        view.backgroundColor = UIColor(named: "basketColor")
        medicineImageView.isHidden = false
        medicineSetNameLabel.isHidden = false
        editButton.isHidden = false
        favoriteButton.isHidden = false
    }

}
