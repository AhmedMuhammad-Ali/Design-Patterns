//
//  StrategyViewController.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 28/07/2021.
//

import UIKit
///`Strategy design pattern `
///In computer programming, the strategy pattern is a behavioral software design pattern that enables selecting an algorithm at runtime. Instead of implementing a single algorithm directly, code receives run-time instructions as to which in a family of algorithms to use
///Encapsulates algorithms in classes, making them reusable and interchangeable at runtime.
///When we should use it
///There are many cases when we can use it. Let’s talk about three very specific scenarios in which we can see a clear value of the Strategy pattern.
///1️⃣ Different ways to do the same
///When you need to do the same thing in your code by different ways, it’s a clear example that you could use it.
///2️⃣ Instead of inheritance
///If you need to extend the functionality of a class and for doing this, you need to create a new class who inherits from it.
///3️⃣ Alternative to if/else blocks
///This is my favourite. Sometimes, if you look at a class, you can see that it has too much if/else or switch blocks, I mean, conditional blocks. This is a sign that this class has more responsibilities than it should. Using a Strategy pattern would help you distribute them.
///What: A protocol that defines the action that we want to encapsulate. In our example, the action would be log a message.
///Who: An object who contains an object who conforms the strategy. In our example, it could be an object who using the strategy log the message.
///How: Specific implementations of the strategy. Each implementation is different. In our example, we would have three strategies, one for each style.
class StrategyViewController: UIViewController {
        
    // MARK: - Lifecycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - IBActions
    //
    @IBAction func upercaseButtonTapped(_ sender: Any) {
        let logger = Logger(strategy: UppercasedStrategy())
        logger.log("my first strategy")
    }
    @IBAction func lowercaseButtonTapped(_ sender: Any) {
        let logger = Logger(strategy: UppercasedStrategy())
        logger.log("my first strategy")
    }
    @IBAction func capitalizeButtonTapped(_ sender: Any) {
        let logger = Logger(strategy: CapitalizedStrategy())
        logger.log("my first strategy")
    }
}
