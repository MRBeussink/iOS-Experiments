//
//  FirstViewController.swift
//  SegueTest
//
//  Created by Mark Beussink on 20180120.
//

import UIKit

class FirstViewController: UITableViewController {

    var strings = ["First", "Second", "Third"]
    var numbers = [1, 2, 3]
    
}

// MARK: - View

extension FirstViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded first view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "showNew":
            let navVC = segue.destination as! UINavigationController
            let vc = navVC.topViewController as! SecondViewController
            
        case "showNumber":
            let vc = segue.destination as! ThirdViewController
            
            if let index = tableView.indexPathForSelectedRow?.row {
                vc.index = index
                vc.number = numbers.element(at: index)
            }
            
        default:
            fatalError("Defaulting on segue identifier switch.")
        }
    }
    
}

// MARK: - Table View Data Source

extension FirstViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return max(strings.count, numbers.count)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstView")!
        
        let row = indexPath.row
        
        if let string = strings.element(at: row) {
            cell.textLabel?.text = string
        } else {
            cell.textLabel?.text = ""
        }
        
        if let number = numbers.element(at: row) {
            cell.detailTextLabel?.text = "\(number)"
        } else {
            cell.detailTextLabel?.text = ""
        }
        
        return cell
    }
}

