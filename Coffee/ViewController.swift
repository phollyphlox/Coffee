//
//  ViewController.swift
//  Coffee
//
//  Created by admin on 2/20/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var orders = ["Order:"]
    var prices = [0.00]
    
    
    @IBOutlet weak var cupStackView: UIStackView!
    @IBOutlet weak var orderLabel: UILabel!
    @IBOutlet weak var milkSwitch: UISwitch!
    @IBOutlet weak var iceSwitch: UISwitch!
    @IBOutlet weak var sugarSwitch: UISwitch!
    @IBOutlet weak var decafSwitch: UISwitch!
    @IBOutlet weak var orderStackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        orderLabel.text = "Coffee Order:"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addcup(_ sender: AnyObject) {
        var message = ""
        var price = 0.00
        
        let cupImage = UIImageView(image: UIImage(named: "RedCoffeeCup"))
        cupImage.contentMode = .scaleAspectFit
        UIView.animate(withDuration: 0.75, animations: {
            self.cupStackView.addArrangedSubview(cupImage)
            self.cupStackView.layoutIfNeeded()
        })
        if iceSwitch.isOn {
            message += "\nIced Coffee"
            price += 3.00
        }
        else{
           message += "\nBlack Coffee"
            price += 2.00
        }
        if milkSwitch.isOn{
            message += ", Milk"
            price += 0.50
        }
        if sugarSwitch.isOn{
            message += ", Sugar"
            price += 0.50
        }
        if decafSwitch.isOn {
            message += ", Decaf"
        }
        prices += [price]
        orders += [message]
        message = ""
        orderLabel.text = ""
        for index in 0 ... orders.count - 1 {
            message = orders[index] + String(format: " $%.2f", prices[index])
            orderLabel.text?.append(message)
        }
    }
    
    @IBAction func removeCup(_ sender: AnyObject) {
        var message = ""
        let lastCupAdded = self.cupStackView.arrangedSubviews.last
        if let cup = lastCupAdded
        {
            UIView.animate(withDuration: 0.25, animations: {
                self.cupStackView.removeArrangedSubview(cup)
                cup.removeFromSuperview()
                self.cupStackView.layoutIfNeeded()
            })
        }
        let lastIndex = orders.count - 1
        orders.remove(at: lastIndex)
        prices.remove(at: lastIndex)
        orderLabel.text = ""
        for index in 0 ... orders.count - 1 {
            message = orders[index] + String(format: " $%.2f", prices[index])
            orderLabel.text?.append(message)
        }

    }

    @IBAction func doneButton(_ sender: AnyObject) {
        var total = 0.00
        var message = ""
        for index in 0 ... prices.count - 1 {
            total += prices[index]
        }
        message = String(format: "\nYour total is $%.2f\nThank You.", total)
        orderLabel.text?.append(message)
    }
}

