//
//  DescriptionOfTheoryViewController.swift
//  Diophanti
//
//  Created by Алекс Мерсер on 02.02.2022.
//

import UIKit

class DescriptionOfTheoryViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var theory: Theory!

    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = theory.title
        descriptionTextView.text = theory.description

    }
}
