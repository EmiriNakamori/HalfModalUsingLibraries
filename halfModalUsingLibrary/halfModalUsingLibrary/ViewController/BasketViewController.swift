//
//  BasketViewController.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/26.
//

import UIKit

class BasketViewController: UIViewController
{

    @IBOutlet weak var basketTopView: BasketTopView!
    @IBOutlet weak var basketBottomView: BasketBottomView!
    @IBOutlet weak var basketTopViewHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "basketColor")
        basketTopView.deleteMedicineDelegate = self
        basketTopView.sendMedicinesDelegate = self
    }

    func addMedicine(medicine: BasketMedicine) {
        basketTopView.basketMedicines.append(medicine)
        basketTopView.sendMedicinesValue()
    }

}

extension BasketViewController: DeletedMedicineDelegate {

    func deleteMedicines(basketMedicines: [BasketMedicine]) {
        basketTopView.basketMedicines = basketMedicines
        basketTopView.sendMedicinesValue()
    }
}

extension BasketViewController: SendMedicinesDelegate {
    func sendMedicines(basketMedicines: [BasketMedicine]) {
        basketBottomView.basketMedicines = basketMedicines
    }
}
