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

    var isFavorite = false

    @IBAction func tappedOkButton(_ sender: Any) {
        delegateTappedOkButton?.tappedOkButton()
    }

    func refreshView() {
        chengeMedicineIconAndMedicineSetName(basketMedicines: basketMedicines)
    }

    func chengeMedicineIconAndMedicineSetName(basketMedicines: [BasketMedicine]) {
        if basketMedicines.count == 0 {
            delegateMoveFloatingPanel?.moveDownPanel()
            delegateMoveFloatingPanel?.controlPanel()
        } else if basketMedicines.count == 1 {
            medicineImageView.image = UIImage(named: "medicine1")
            medicineSetNameLabel.text = basketMedicines[0].medicineName
            editButton.isHidden = true
            favoriteButton.isHidden = true
        } else {
            medicineImageView.image = UIImage(named: "inp_icon_drug_multi_16")
            medicineSetNameLabel.text = "現在時刻"
            editButton.isHidden = false
            favoriteButton.isHidden = false
            setFavoriteOn(isFavorite: isFavorite)
        }

    }

    func setFavoriteOn(isFavorite: Bool) {
        if isFavorite {
            let offFavoriteImage = UIImage(named: "Icon_favorite_on")
            favoriteButton.setImage(offFavoriteImage, for: UIControl.State())
            editButton.isHidden = false
        } else {
            let onFavoriteImage = UIImage(named: "Icon_favorite_off")
            favoriteButton.setImage(onFavoriteImage, for: UIControl.State())
        }
        editButton.isHidden = true

    }


    @IBAction func tappedFavoriteButton(_ sender: Any) {
        
    }

}
