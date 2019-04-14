//
//  ExhibitionsTableViewCell.swift
//  TestExhibitsPresentation
//
//  Created by vit on 4/13/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit

class ExhibitsTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Data storage
    var exhibitObject: Exhibit?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // set collectionViewCell layout
        setFlowLayout()
        // delegate collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // set layout collectionViewCell
    func setFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 210, height: 240)
        flowLayout.minimumLineSpacing = 10.0
        flowLayout.minimumInteritemSpacing = 5.0
        self.collectionView.collectionViewLayout = flowLayout
    }
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return exhibitObject?.images.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // create a collectionViewCell instance
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! ExhibitsCollectionViewCell
        // data to display
        let title = exhibitObject?.title ?? ""
        let imageLink = exhibitObject?.images[indexPath.row] ?? ""
        // transfer data to collectionViewCell instance
        cell.updateCollectionViewCell(withTitle: title, withImageLink: imageLink)
        
        return cell
    }
    
    func updateCell(withExhibit exhibit: Exhibit) {
        exhibitObject = exhibit
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
}
