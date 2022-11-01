//
//  BasketViewController.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/26.
//

import UIKit

class BasketViewController: UIViewController {
    @IBOutlet weak var basketTopView: BasketTopView!

    private var selectingMedicines: [Medicine] = []

    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "basketColor")

    }

    func addMedicine(medicine: Medicine) {
        selectingMedicines.append(medicine)
        basketTopView.medicines = selectingMedicines
    }

}
