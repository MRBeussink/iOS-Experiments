//
//  ThirdViewController.swift
//  SegueTest
//
//  Created by Mark Beussink on 20180120.
//

import UIKit

class ThirdViewController: UITableViewController {
    
    var index: Int?
    var number: Int?

}

// MARK: - View

extension ThirdViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded third view")
    }
}

// MARK: - TableViewDataSource

extension ThirdViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "numberViewCell") as! ThirdViewCell
        
    }
}



class ThirdViewCell: UITableViewCell {
    
    @IBOutlet var numberField: UITextField!
}
