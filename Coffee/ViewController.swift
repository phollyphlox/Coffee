//
//  ViewController.swift
//  Coffee
//
//  Created by admin on 2/20/17.
//  Copyright © 2017 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var cupCount = 0
    var message = ""
    var price = 0.0
    var orders = ["Order:"]
    
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
        cupCount += 1
        price += 1.99
        message = ""
        let cupImage = UIImageView(image: UIImage(named: "RedCoffeeCup"))
        cupImage.contentMode = .scaleAspectFit
        UIView.animate(withDuration: 0.75, animations: {
            self.cupStackView.addArrangedSubview(cupImage)
            self.cupStackView.layoutIfNeeded()
        })
        if iceSwitch.isOn {
            message += "\nIced Coffee"
        }
        else{
           message += "\nBlack Coffee"
        }
        if milkSwitch.isOn{
            message += ", Milk"
        }
        if sugarSwitch.isOn{
            message += ", Sugar"
        }
        if decafSwitch.isOn {
            message += ", Decaf"
        }
        orders += [message]
        message = ""
        orderLabel.text = ""
        for index in 0 ... orders.count - 1 {
            message = orders[index]
            orderLabel.text?.append(message)
        }
    }
    
    @IBAction func removeCup(_ sender: AnyObject) {
        cupCount -= 1
        price -= 1.99
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
        message = ""
        orderLabel.text = ""
        for index in 0 ... orders.count - 1 {
            message = orders[index]
            orderLabel.text?.append(message)
        }

    }

    @IBAction func doneButton(_ sender: AnyObject) {
        orderLabel.text?.append("\nYour total is $\(price)\n")
        orderLabel.text?.append("Thank you")
    }
}

