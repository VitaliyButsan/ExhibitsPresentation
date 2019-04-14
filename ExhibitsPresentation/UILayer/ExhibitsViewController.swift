//
//  ViewController.swift
//  TestExhibitsPresentation
//
//  Created by vit on 4/13/19.
//  Copyright © 2019 vit. All rights reserved.
//

import UIKit

class ExhibitsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    // singleton for receives data
    let exhibitsLoader = ExhibitsLoader()
    // data storage
    var exhibitsArray: [Exhibit] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
    }

    // receive and save data
    func reloadData() {
        exhibitsLoader.getExhibitList { exhibits in
            if !exhibits.isEmpty {
                // save data to array
                self.exhibitsArray = exhibits
                // reload tablView
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                self.alertHandler()
            }
        }
    }
    
    // setup alert
    func alertHandler() {
        let alert = UIAlertController(title: "Images not found!", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Try again", style: .default, handler: { _ in self.reloadData() }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: UITableViewDelegate, UITableViewDataSource
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.exhibitsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a tableViewCell instance
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ExhibitsTableViewCell
        // transfer data to tableViewCell instance
            cell.updateCell(withExhibit: exhibitsArray[indexPath.row])
        return cell
    }
    
}

