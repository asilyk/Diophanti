//
//  TheoryTableViewController.swift
//  Diophanti
//
//  Created by Алекс Мерсер on 02.02.2022.
//

import UIKit

class TheoryTableViewController: UITableViewController {

    private var theoryList = Theory.getTheoryList()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Theory"
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        theoryList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "theoryCell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        let theory = theoryList[indexPath.row]
        
        content.text = theory.title
        content.image = UIImage(named: theory.title)
        content.imageProperties.cornerRadius = tableView.rowHeight / 2
        
        cell.contentConfiguration = content
        return cell
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let descriptionVC = segue.destination as? DescriptionOfTheoryViewController else { return }
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        let theory = theoryList[indexPath.row]
        descriptionVC.theory = theory
    }

}
