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
    @IBOutlet weak var detailedSolutionLabel: UILabel!
    
    @IBOutlet weak var showDetailedSolutionButton: UIButton!
    
    private var coefficient = 0
    private var firstFreeMember = 0
    private var secondFreeMember = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.isHidden = true

        detailedSolutionLabel.isHidden = true
        showDetailedSolutionButton.isHidden = true
        showDetailedSolutionButton.setTitle("Show detailed solution", for: .normal)
    }
    
    // MARK: - IB Actions
    
    @IBAction func solveButtonPressed() {
        let resultOfEquation = LinearEquation(
            coefficient: coefficient,
            firstFreeMember: firstFreeMember,
            secondFreeMember: secondFreeMember
        ).solve()

        resultLabel.text = resultOfEquation.0
        detailedSolutionLabel.text = resultOfEquation.1

        resultLabel.isHidden = false
        showDetailedSolutionButton.isHidden = false
    }
    
    @IBAction func deployeSolutionButtonPressed() {
        detailedSolutionLabel.isHidden.toggle()

        if detailedSolutionLabel.isHidden {
            showDetailedSolutionButton.setTitle("Show detailed solution", for: .normal)
        } else {
            showDetailedSolutionButton.setTitle("Hide detailed solution", for: .normal)
        }
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
            case firstNumberTextField: coefficient = currentValue
            case secondNumberTextField: firstFreeMember = currentValue
            default: secondFreeMember = currentValue
            }
            return
        }

        if number == "" {
            switch textField {
            case firstNumberTextField: coefficient = 0
            case secondNumberTextField: firstFreeMember = 0
            default: secondFreeMember = 0
            }

            return
        }

        showDetailedSolutionButton.isHidden = true
        resultLabel.isHidden = true
        detailedSolutionLabel.isHidden = true
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


