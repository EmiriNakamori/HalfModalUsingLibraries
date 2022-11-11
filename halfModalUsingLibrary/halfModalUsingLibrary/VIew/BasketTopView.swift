//
//  BasketTopView.swift
//  halfModalUsingLibrary
//
//  Created by nakamori on 2022/10/27.
//

import UIKit

protocol DeletedMedicineDelegate: AnyObject {
    func deleteMedicines(basketMedicines: [BasketMedicine])
}

protocol SendMedicinesDelegate: AnyObject {
    func sendMedicines(basketMedicines: [BasketMedicine])
}

protocol SendViewHeightDelegate: AnyObject {
    func sendViewHeight(height: CGFloat)
}

final class BasketTopView: NibView {


    @IBOutlet weak var collectionView: UICollectionView!


    var basketMedicines: [BasketMedicine] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    weak var sendViewHeightDelegate: SendViewHeightDelegate?
    weak var deleteMedicineDelegate: DeletedMedicineDelegate?
    weak var sendMedicinesDelegate: SendMedicinesDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }

    private func setUp() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "BasketCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BasketCollectionViewCell")
        sendViewHeightDelegate?.sendViewHeight(height: view.bounds.height)
    }

    func sendMedicinesValue() {
        sendMedicinesDelegate?.sendMedicines(basketMedicines: basketMedicines)
    }
}

extension BasketTopView: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return basketMedicines.count

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BasketCollectionViewCell", for: indexPath) as! BasketCollectionViewCell
        let cellImageView = UIImage(named: "medicine1")
        cell.imageView.image = cellImageView
        cell.nameLabel.text = basketMedicines[indexPath.row].medicineName
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        basketMedicines.remove(at: indexPath.row)
        deleteMedicineDelegate?.deleteMedicines(basketMedicines: basketMedicines)
        print("メディシンを消した", basketMedicines)

    }

}

extension BasketTopView: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 53.0
        let height = 55.0
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}



