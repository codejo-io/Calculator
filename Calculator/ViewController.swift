//
//  ViewController.swift
//  Calculator
//
//  Created by Matt Casanova on 6/15/20.
//  Copyright © 2020 Codejo.io. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let offColor = UIColor.systemOrange
    static let onColor = UIColor.orange
    
    
    @IBOutlet weak var numberTextField: UITextField!
    
    @IBOutlet weak var divideButton: BorderButton!
    @IBOutlet weak var multiplyButton: BorderButton!
    @IBOutlet weak var subtractButton: BorderButton!
    @IBOutlet weak var addButton: BorderButton!
    @IBOutlet weak var equalButton: BorderButton!
    
    var savedValue: Double = 0
    var display: String = "0"
    var shouldReset = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberTextField.text = display
        resetOperatorColors()
    }

    /**
     
     */
    @IBAction func onNumberClicked(_ sender: BorderButton) {
        guard let text = sender.currentTitle else { return }
        
        if (shouldReset) {
            display = text
            shouldReset = false
        } else {
            display.append(text)
        }
        
        numberTextField.text = display
    }
  
    /**
     
     */
    @IBAction func onSignClicked(_ sender: BorderButton) {
        if (display == "0") {
            return
        }
        
        if (display.starts(with: "-")) {
            display.removeFirst()
        } else {
            display.insert("-", at: display.startIndex)
        }
        
        numberTextField.text = display
    }
    
    @IBAction func onClearClicked(_ sender: BorderButton) {
        
        switch sender.currentTitle {
        case "AC":
            resetOperatorColors()
            savedValue = 0
            display = "0"
            break
        case "C":
            display = "0"
            break
        default:
            //Since it needs to be exhaustive
            break;
            
        }
        
        shouldReset = true
        numberTextField.text = display
    }
    
    @IBAction func onOperatorClicked(_ sender: BorderButton) {

        shouldReset = true
        
        if sender == equalButton {
            processOperator()
            resetOperatorColors()
        } else if let value = Double(display) {
            resetOperatorColors()
            savedValue = value
            sender.backgroundColor = ViewController.onColor
        }
        
    }
    
    func resetOperatorColors() {
        divideButton.backgroundColor = ViewController.offColor
        multiplyButton.backgroundColor = ViewController.offColor
        subtractButton.backgroundColor = ViewController.offColor
        addButton.backgroundColor = ViewController.offColor
    }
    
    func processOperator() {
        guard let value = Double(display) else { return }
        
        if divideButton.backgroundColor == ViewController.onColor {
             display = "\(savedValue / value)"
        } else if multiplyButton.backgroundColor == ViewController.onColor {
            display = "\(savedValue * value)"
        } else if subtractButton.backgroundColor == ViewController.onColor {
            display = "\(savedValue - value)"
        } else if addButton.backgroundColor == ViewController.onColor {
            display = "\(savedValue + value)"
        }
        
        numberTextField.text = display
    }
    
}

