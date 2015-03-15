//
//  ViewController.swift
//  Calculator
//
//  Created by Domenico on 15.03.15.
//  Copyright (c) 2015 Domenico Solazzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var userIsDigitingNumber: Bool = false
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!
        if userIsDigitingNumber{
            display.text = display.text! + digit
        }else{
            display.text = digit
            userIsDigitingNumber = true
        }
    }
    @IBAction func enter() {
        userIsDigitingNumber = false
    }
}

