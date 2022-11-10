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

final class BasketBottomView: NibView {

    @IBOutlet weak var medicineImageView: UIImageView!
    @IBOutlet weak var medicineSetNameLabel: UILabel!
    weak var delegate: TappedOkButtonDelegate?

    var basketMedicines: [BasketMedicine] = [] {
        didSet {
            refreshView()
        }
    }

    override func layoutSubviews() {
        refreshView()
        super.layoutSubviews()
    }

    @IBAction func tappedOkButton(_ sender: Any) {
        delegate?.tappedOkButton()
    }

    func refreshView() {
        chengeMedicineIconAndMedicineSetName(basketMedicines: basketMedicines)
    }

    func chengeMedicineIconAndMedicineSetName(basketMedicines: [BasketMedicine]) {
        if basketMedicines.count == 0 {
            // バスケットを下げる
        } else if basketMedicines.count == 1 {
            medicineImageView.image = UIImage(named: "medicine1")
            medicineSetNameLabel.text = "単体の薬名"

        } else {
            medicineImageView.image = UIImage(named: "inp_icon_drug_multi_16")
            medicineSetNameLabel.text = "現在時刻"
        }

    }

}
