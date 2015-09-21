//
//  ViewController.swift
//  Calculator
//
//  Created by Godot on 21/09/15.
//  Copyright (c) 2015 Godot. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    var usrInTheMiddleOfTyping :Bool=false
    
    @IBAction func buttonPressed(sender: UIButton)
    
    {
       let digit=sender.currentTitle!
        if usrInTheMiddleOfTyping
        {
        display.text=display.text! + digit
        }
        else
        {
            display.text=digit
            usrInTheMiddleOfTyping=true
        }
      // println("digit=\(digit)")
        
        
        
        
  }
    var operandStack:Array<Double>=Array<Double>()
    
    @IBAction func enter()
    {
        usrInTheMiddleOfTyping=false
        operandStack.append(displayValue)
        println("operandStack=\(operandStack)")
        
    }
    var displayValue:Double
        {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text="\(newValue)"
            usrInTheMiddleOfTyping=false
        }
    
       }
    
    @IBAction func operate(sender: UIButton)
    {
        var operation=sender.currentTitle!
        
        switch operation
        {
     //   case "+" : performOperation{$op1+ $op2}
        case "-" : performOperation(){(op1:Double,op2:Double) -> Double
                
               in  return op1-op2
            }
        case "*" : performOperation() {(op1:Double,op2:Double) -> Double
            
            in  return op1*op2
            }
        case "/" :performOperation({  $0*$1 })  //doesn,t need return key also .xcode knows it
        case "+":performOperation{$0+$1}


//
//             case "/" : performOperation(divide)
//             case "+" : performOperation(add)
//             case "-" : performOperation(substract)
//            
//        case "+" :if(operandStack.count>=2)
//        {
//            displayValue=operandStack.removeLast() + operandStack.removeLast()
//            enter()
//        }
//        case "-" :
//            if(operandStack.count>=2)
//            {
//            displayValue=operandStack.removeLast() - operandStack.removeLast()
//            }
//        case "/" :
//            if(operandStack.count>=2)
//            {
//                displayValue=operandStack.removeLast() / operandStack.removeLast()
//            }
       default:break
//        
         }
    }
        func performOperation(operation: (Double,Double)->Double)
        {
            if(operandStack.count>=2)
            {
            displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
            enter()
            }
        }
//        func multiply(op1:Double,op2:Double)->Double
//        {
//            return op1*op2
//        }
//        func divide(op1:Double,op2:Double)->Double
//        {
//            return op1/op2
//        }
//        func add(op1:Double,op2:Double)->Double
//        {
//            return op1+op2
//        }
//        func substract(op1:Double,op2:Double)->Double
//        {
//            return op1-op2
//        }
    
    
        

 
    
    
    
    
    

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }


}

