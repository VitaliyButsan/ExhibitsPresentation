//
//  FileExhibitsLoader.swift
//  Exhibitions
//
//  Created by vit on 4/13/19.
//  Copyright © 2019 vit. All rights reserved.
//

import Foundation

class ExhibitsLoader: IExhibitsLoaderProtocol {

    // receives data using completion handler
    func getExhibitList(handler: @escaping ([Exhibit]) -> Void) {
        
        // Create a url request
        let stringUrl = "https://goo.gl/t1qKMS"
        guard let url = URL(string: stringUrl) else { return }
        let urlRequest = URLRequest(url: url)
        
        // UrlSession call
        URLSession.shared.dataTask(with: urlRequest) { (data, rosponse, error) in
            guard let data = data else { return handler([]) }
            
            do {
                let result = try JSONDecoder().decode(Exhibitions.self, from: data)
                handler(result.list)
            } catch {
                handler([])
            }
            
        }.resume()
    }
 
}

