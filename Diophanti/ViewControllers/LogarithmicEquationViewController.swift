//
//  LogarithmicEquationViewController.swift
//  Diophanti
//
//  Created by Алекс Мерсер on 02.02.2022.
//

import UIKit

class LogarithmicEquationViewController: UIViewController {
    
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var deploySolutionLabel: UILabel!
    
    @IBOutlet weak var showDetailedSolutionButton: UIButton!
    
    private var exponent = 0
    private var logValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true

        deploySolutionLabel.isHidden = true
        showDetailedSolutionButton.isHidden = true
        showDetailedSolutionButton.setTitle("Show detailed solution", for: .normal)
    }
    
    //MARK: - IB Actions
    
    @IBAction func solveButtonPressed() {

        let resultOfEquation = LogarithmicEquation(exponent: exponent, logValue: logValue).solve()

        resultLabel.text = resultOfEquation.0
        deploySolutionLabel.text = resultOfEquation.1

        resultLabel.isHidden = false
        showDetailedSolutionButton.isHidden = false
        
    }
    
    @IBAction func deploySolutionButtonPressed() {
        deploySolutionLabel.isHidden.toggle()
        
        if deploySolutionLabel.isHidden {
            showDetailedSolutionButton.setTitle("Show detailed solution", for: .normal)
        } else {
            showDetailedSolutionButton.setTitle("Hide detailed solution", for: .normal)
        }
    }
}

// MARK: - Private Methods

extension LogarithmicEquationViewController {
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
}
// MARK: - UITextFieldDelegate

extension LogarithmicEquationViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let number = textField.text else { return }
        
        if let currentValue = Int(number) {
            switch textField {
            case firstNumberTextField: exponent = currentValue
            default: logValue = currentValue
            }
            return
        }
        
        if number == "" { return }

        showDetailedSolutionButton.isHidden = true
        resultLabel.isHidden = true
        deploySolutionLabel.isHidden = true
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
