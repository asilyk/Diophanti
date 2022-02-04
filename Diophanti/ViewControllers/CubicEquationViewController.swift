//
//  CubicEquationViewController.swift
//  Diophanti
//
//  Created by Алекс Мерсер on 01.02.2022.
//

import UIKit

class CubicEquationViewController: UIViewController {
    
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var thirdNumberTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var detailedSolutionTextView: UITextView!
    
    @IBOutlet weak var showDetailedSolutionButton: UIButton!
    
    
    private var a = 0
    private var b = 0
    private var c = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true
        
        detailedSolutionTextView.isHidden = true
        showDetailedSolutionButton.isHidden = true
        showDetailedSolutionButton.setTitle("Show detailed solution", for: .normal)
    }
    
    // MARK: - IB Actions
    
    @IBAction func solveButtonPressed() {
        let resultOfEquation = CubicEquation(a: a, b: b, c: b).solve()
        resultLabel.text = resultOfEquation.0
        detailedSolutionTextView.text = resultOfEquation.1
        
        resultLabel.text = resultOfEquation.0
        detailedSolutionTextView.text = resultOfEquation.1

        resultLabel.isHidden = false
        showDetailedSolutionButton.isHidden = false
    }
    
    @IBAction func deploySolutionButtonPressed() {
        detailedSolutionTextView.isHidden.toggle()
        
        if detailedSolutionTextView.isHidden {
            showDetailedSolutionButton.setTitle("Show detailed solution", for: .normal)
        } else {
            showDetailedSolutionButton.setTitle("Hide detailed solution", for: .normal)
        }
    }
    
}

// MARK: - Private Methods

extension CubicEquationViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}

// MARK: - UITextFieldDelegate

extension CubicEquationViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let number = textField.text else { return }
        
        if let currentValue = Int(number) {
            switch textField {
            case firstNumberTextField: a = currentValue
            case secondNumberTextField: b = currentValue
            default: c = currentValue
            }
            return
        }

        if number == "" { return }

        showDetailedSolutionButton.isHidden = true
        resultLabel.isHidden = true
        detailedSolutionTextView.isHidden = true
        textField.text = ""

        showAlert(title: "Error!", message: "Enter correct format: integer number")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        let keyboardToolbar = UIToolbar()
        keyboardToolbar.sizeToFit()
        textField.inputAccessoryView = keyboardToolbar
        
        let doneButton = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
}
