//
//  ViewController.swift
//  TestTask-Funbox
//
//  Created by admin on 20.07.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class StoreFrontViewController: UIViewController {
    //MARK: - IBOutlet
    @IBOutlet var collectionView: UICollectionView!
    
    //MARK: = Properties
    let collectionCell = "StoreFrontCollectionViewCell"
    var dataArray = [PriceList]()
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
       configure()
        readFromFile()
    }
    //MARK: - Private Functions
    private func configure() {
        collectionView.register(UINib(nibName: collectionCell, bundle: nil), forCellWithReuseIdentifier: StoreFrontCollectionViewCell.reuseId)
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.isPagingEnabled = true
    }
    
    private func readFromFile() {
        guard let path = Bundle.main.path(forResource: "data", ofType: "csv"),
            let text = try? String(contentsOfFile: path) else {
                return
        }        
        let array = text.components(separatedBy: "\n")
        
        for i in array {
            let result = i.components(separatedBy: ", ")
            var name = result[0]
            name.removeFirst()
            name.removeLast()
            var price = result[1]
            price.removeFirst()
            price.removeLast()
            var count = result[2].trimmingCharacters(in: .whitespacesAndNewlines)
            count.removeFirst()
            count.removeLast()
            guard let newCount = Int(count) else { return }
            let newArray = PriceList(name: name, price: price, count: newCount)
            dataArray.append(newArray)
        }
    }
}
//MARK: - CollectionViewDataSource
extension StoreFrontViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: StoreFrontCollectionViewCell.reuseId, for: indexPath) as? StoreFrontCollectionViewCell
        guard let cell = collectionCell else {
            return UICollectionViewCell()
        }
        let array = dataArray[indexPath.row]
        cell.nameModelLabel.text = array.name
        cell.priceLabel.text = array.price
        cell.countLabel.text = "\(array.count) шт"
        return cell
    }
}
//MARK: - CollectionViewDelegate
extension StoreFrontViewController: UICollectionViewDelegate {
    
}
//MARK: - CollectionViewDelegateFlowLayout
extension StoreFrontViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        coordinator.animate(alongsideTransition: { (_) in
            self.collectionView.collectionViewLayout.invalidateLayout()
            if self.dataArray.count == 0 {
                self.collectionView.contentOffset = .zero
            } else {
                let indexPath = IndexPath(item: self.dataArray.count, section: 0)
                self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            }
        }, completion: nil)
    }
}

