//
//  BasketViewController.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/26.
//

import UIKit

class BasketViewController: UIViewController {
    @IBOutlet weak var basketTopView: BasketTopView!

    var selectingMedicines: [BasketMedicine] = [] {
        didSet {
            notificationMultipleMedicine()
        }
    }


    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "basketColor")
        basketTopView.delegate = self
    }

    func addMedicine(medicine: BasketMedicine) {
        selectingMedicines.append(medicine)
        print("選択されたメディシンBascketVC", selectingMedicines)
        basketTopView.basketMedicines = selectingMedicines
    }

    private func notificationMultipleMedicine() {
        if selectingMedicines.count > 1{
            let isMultiple = true
            let basketBottomView = BasketBottomView()
            basketBottomView.isMultiple = isMultiple
        }
    }

}

extension BasketViewController: DeletedMedicineDelegate {
    func deleteMedicine(basketMedicines: [BasketMedicine]) {
        self.selectingMedicines = basketMedicines
    }
}
