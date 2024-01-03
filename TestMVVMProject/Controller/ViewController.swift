//
//  ViewController.swift
//  TestMVVMProject
//
//  Created by Suresh Sindam on 1/2/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = DataViewModel()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assignData()
        
        // Do any additional setup after loading the view.
    }
    
    func assignData() {
        viewModel.fetchData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        
    }


}

// MARK: UITableViewDeleteMethods
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.noOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.setRowAtIndex(index: indexPath.row)
        cell.textLabel?.numberOfLines = 0
        return cell
    }
    
    
}

