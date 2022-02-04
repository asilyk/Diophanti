//
//  EquationsViewController.swift
//  Diophanti
//
//  Created by Alexander on 01.02.2022.
//

import UIKit

class EquationsViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Equations"
    }

}
