//
//  ExhibitionCollectionViewCell.swift
//  TestExhibitsPresentation
//
//  Created by vit on 4/13/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit

class ExhibitsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var exhibitImageView: UIImageView!
   
    // Set layout to subviews collectionViewCell
    override func layoutSubviews() {
        super.layoutSubviews()
        
        exhibitImageView.layer.cornerRadius = 10
        exhibitImageView.layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        exhibitImageView.layer.masksToBounds = true
        self.clipsToBounds = false
    }
    
    // define update cell func 
    func updateCollectionViewCell(withTitle title: String, withImageLink imageLink: String) {
        // set title
        textLabel.text = title
        
        // "http" --> "https"
        var secureImageLink = imageLink
        let first5 = String(secureImageLink.prefix(5))
        if first5 != "https" {
            secureImageLink = "https" + imageLink.dropFirst(4)
        }
        
        // set image
        DispatchQueue.global(qos: .userInitiated).async {
            if let url = URL(string: secureImageLink) {
                let data = try? Data(contentsOf: url)
                if let imageData = data {
                    let image = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        self.exhibitImageView.image = image
                    }
                }
            }
        }
        
    }
}

