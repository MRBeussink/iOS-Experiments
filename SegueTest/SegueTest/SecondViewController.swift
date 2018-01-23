//
//  SecondViewController.swift
//  SegueTest
//
//  Created by Mark Beussink on 20180120.
//

import UIKit

class SecondViewController: UITableViewController {
    
    var number: Int?
    
    // MARK: - Actions
    
    @IBAction func cancel(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true)
    }
}

// MARK: - View

extension SecondViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded second view")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier! {
        case "showNumber":
            let vc = segue.destination as! ThirdViewController
            
        default:
            fatalError("Defaulting on segue identifier switch.")
        }
    }
    
    
}

// MARK: - TableViewDataSource

extension SecondViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleViewTitleCell")
                as! SecondViewTitleCell
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleViewNumberCell")!
            
            if let number = self.number {
                cell.detailTextLabel?.text = "\(number)"
                
            } else {
                cell.detailTextLabel?.text = "?"
                cell.detailTextLabel?.textColor = UIColor.gray
            }
            
            return cell
            
        default:    // throw a fit
            fatalError("Woah there buddy!")
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
}

// MARK: - Actions

extension SecondViewController {
    
    
}

class SecondViewTitleCell: UITableViewCell {
    
    @IBOutlet var titleField: UITextField!
    
}


