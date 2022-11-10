//
//  BasketViewController.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/26.
//

import UIKit

class BasketViewController: UIViewController {
    @IBOutlet weak var basketTopView: BasketTopView!
    @IBOutlet weak var basketBottomView: BasketBottomView!


    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "basketColor")
        basketTopView.delegate = self
        basketTopView.isMultipleDelegate = self
    }

    func addMedicine(medicine: BasketMedicine) {
        basketTopView.basketMedicines.append(medicine)
        basketTopView.sendIsMultipleValue()
    }

}

extension BasketViewController: DeletedMedicineDelegate {
    func deleteMedicine(basketMedicines: [BasketMedicine]) {
        basketTopView.basketMedicines = basketMedicines
        basketTopView.sendIsMultipleValue()
    }
}

extension BasketViewController: SendIsMultipleDelegate {
    func sendIsMultiple(isMultiple: Bool) {
        basketBottomView.isMultiple = isMultiple
    }
}
