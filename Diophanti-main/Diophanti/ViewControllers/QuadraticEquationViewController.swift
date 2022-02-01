//
//  DetailedSolutionViewController.swift
//  Diophanti
//
//  Created by Alexander on 01.02.2022.
//

import UIKit

class QuadraticEquationViewController: UIViewController {
    
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var thirdNumberTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var solutionTextLabel: UILabel!
    
    var equation = QuadraticEquation(firstCoefficient: 0, secondCoefficient: 0, freeMember: 0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        solutionTextLabel.isHidden = true
    }
    
    // MARK: - IB Actions

    @IBAction func solveButtonPressed() {
        let resultOfEquation = equation.solve()
        resultLabel.text = resultOfEquation.last
        let text = resultOfEquation.joined(separator: " ")
        solutionTextLabel.text = text
    }
    
    @IBAction func deploySolutionButtonPressed() {
        solutionTextLabel.isHidden.toggle()
    }
}

// MARK: - Private Methods

extension QuadraticEquationViewController {

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

extension QuadraticEquationViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let number = textField.text else { return }
        
        if let currentValue = Int(number) {
            switch textField {
            case firstNumberTextField: equation.firstCoefficient = currentValue
            case secondNumberTextField: equation.secondCoefficient = currentValue
            default: equation.freeMember = currentValue
            }
            return
        }
        
        showAlert(title: "Oops", message: "Enter correct format")
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
