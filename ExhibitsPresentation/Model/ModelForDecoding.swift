//
//  DataModel.swift
//  Exhibitions
//
//  Created by vit on 4/13/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation

// data wrapper
struct Exhibitions: Decodable {
    let list: [Exhibit]
}

class Exhibit: Decodable {
    var title: String
    var images: [String]
    
    init(withTitle title: String, withImages images: [String]) {
        self.title = title
        self.images = images
    }
}
