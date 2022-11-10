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

    var isMultiple: Bool? {
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
        chengeMedicineIconAndMedicineSetName(isMultiple: isMultiple ?? false)
    }

    func chengeMedicineIconAndMedicineSetName(isMultiple: Bool) {
        if !isMultiple {
            self.medicineImageView.image = UIImage(named: "medicine1")
            self.medicineSetNameLabel.text = "単体の薬名"
        } else {
            self.medicineImageView.image = UIImage(named: "inp_icon_drug_multi_16")
            self.medicineSetNameLabel.text = "現在時刻"
        }
    }


}
