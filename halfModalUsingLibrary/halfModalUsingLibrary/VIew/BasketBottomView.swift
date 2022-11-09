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

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    var isMultiple = false {
        didSet {
            chengeMedicineIconAndMedicineSetName(isMultiple: isMultiple)
        }
    }

    @IBAction func tappedOkButton(_ sender: Any) {
        delegate?.tappedOkButton()
    }

    func setUp() {

    }

    func chengeMedicineIconAndMedicineSetName(isMultiple: Bool) {
        print("複数か", isMultiple)
        if isMultiple {
            medicineImageView.image = UIImage(named: "inp_icon_drug_multi_16")
            medicineSetNameLabel.text = "現在時刻"
        }
    }


}
