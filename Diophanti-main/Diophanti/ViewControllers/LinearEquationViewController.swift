//
//  SolutionViewController.swift
//  Diophanti
//
//  Created by Alexander on 01.02.2022.
//

import UIKit

class LinearEquationViewController: UIViewController {
    
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var thirdNumberTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var deployeSolutionLabel: UILabel!
    
    var equation = LinearEquation(coefficient: 0, firstFreeMember: 0, secondFreeMember: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        deployeSolutionLabel.isHidden = true
    }
    
    // MARK: - IB Actions
    
    @IBAction func solveButtonPressed() {
        
        let resultOfEquation = equation.solve()
        resultLabel.text = resultOfEquation.last
        
        let text = resultOfEquation.joined(separator: " ")
        deployeSolutionLabel.text = text
    }
    
    @IBAction func deployeSolutionButtonPressed() {
        deployeSolutionLabel.isHidden.toggle()
    }
}

// MARK: - Private Methods

extension LinearEquationViewController {
    
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

extension LinearEquationViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let number = textField.text else { return }
        
        if let currentValue = Int(number) {
            switch textField {
            case firstNumberTextField: equation.coefficient = currentValue
            case secondNumberTextField: equation.firstFreeMember = currentValue
            default: equation.secondFreeMember = currentValue
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

