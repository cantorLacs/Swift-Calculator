//
//  ViewController.swift
//  calculator
//
//  Created by user268092 on 9/25/24.
//

import UIKit

class ViewController: UIViewController {
    
    var newNumber : Double = 0
    var previousNumber : Double = 0
    var performingMath = false
    var operation = ""
    


    @IBOutlet weak var operationlabel: UILabel!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        operationlabel.text = ""
        resultLabel.text = ""
        // Do any additional setup after loading the view.
    }
    @IBAction func numbPressed(_ sender: UIButton) {
        
        if performingMath == true{
            
            
            
            operationlabel.text = String(sender.tag)
            newNumber = Double(operationlabel.text!)!
            resultLabel.text = resultLabel.text! + operationlabel.text!
            performingMath = false
            
        }
        else
        {
            operationlabel.text = operationlabel.text! + String(sender.tag)
            newNumber = Double(operationlabel.text!)!
            resultLabel.text = resultLabel.text! + String(sender.tag)
        }
        operate()

    }
    @IBAction func operation(_ sender: UIButton) {
        if operationlabel.text != "" {
            previousNumber = Double(operationlabel.text!)!
        }
        else{
            previousNumber = Double(resultLabel.text!)!
        }
        
        if sender.titleLabel?.text == "/"
        {
            operation = "/"
            resultLabel.text = resultLabel.text! + "/"
        }
        
        else if sender.titleLabel?.text == "x"
        {
            operation = "x"
            resultLabel.text = resultLabel.text! + "x"
        }
        
        else if sender.titleLabel?.text == "-"
        {
            operation = "-"
            resultLabel.text = resultLabel.text! + "-"
        }
        
        else if sender.titleLabel?.text == "+"
        {
            operation = "+"
            resultLabel.text = resultLabel.text! + "+"
        }
        else if sender.titleLabel?.text == "%"
        {
            operation = "%"
            resultLabel.text = resultLabel.text! + "%"
        }
        operation = (sender.titleLabel?.text)!
        performingMath = true
    }
    
    
    @IBAction func result(_ sender: Any) {
        newNumber = 0
        previousNumber = 0
        operation = ""
        resultLabel.text = operationlabel.text
        operationlabel.text = ""
    }
    
    func operate (){
        if operation == "/"
        {
            operationlabel.text = String(previousNumber / newNumber)
        }
        else if operation == "x"
        {
            operationlabel.text = String(previousNumber * newNumber)
        }
        else if operation == "-"
        {
            operationlabel.text = String(previousNumber - newNumber)
        }
        else if operation == "+"
        {
            operationlabel.text = String(previousNumber + newNumber)
        }
        else if operation == "%"
        {
            operationlabel.text = String(previousNumber / 100)
        }

       

    }


    @IBAction func period(_ sender: UIButton) {
        operationlabel.text = operationlabel.text! + "."
        resultLabel.text = resultLabel.text! + "."
        newNumber = Double(operationlabel.text!)!
    }
    
    
    @IBAction func errase(_ sender: Any) {
        operationlabel.text = String((operationlabel.text?.dropLast())!)
        resultLabel.text = String((resultLabel.text?.dropLast())!)
        newNumber = Double(operationlabel.text!)!
    }
    
    
    
    @IBAction func negPos(_ sender: Any) {
        operationlabel.text = String(Double(operationlabel.text!)! * -1)
        resultLabel.text = String(Double(resultLabel.text!)! * -1)
    }
        
    
    @IBAction func ac(_ sender: Any) {
        newNumber = 0
        previousNumber = 0
        operation = ""
        resultLabel.text = ""
        operationlabel.text = ""
    }
    
}
