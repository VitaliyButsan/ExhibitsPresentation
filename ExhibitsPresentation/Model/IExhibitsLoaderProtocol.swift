//
//  ProtocolIExhibitsLoader.swift
//  Exhibitions
//
//  Created by vit on 4/13/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation

// Declaring a nitworking protocol
protocol IExhibitsLoaderProtocol {
    func getExhibitList(handler: @escaping ([Exhibit]) -> Void)
}
