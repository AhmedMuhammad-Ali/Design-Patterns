//
//  FirstDelegationViewController.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 27/07/2021.
//

import UIKit

// MARK: - Delegation design patterns
///Delegation design pattern `Falls under `the behavioral design patterns.
///Delegates are a design pattern that allows one object to send messages to another object when a specific event happens.
///Imagine an object A calls an object B to perform an action. Once the action is complete, object A should know that B has completed the task and take necessary action, this can be achieved with the help of delegates!.
///One to One communication pattern
///Avoid tight coupling of objects.
///Modify behavior and appearance without the need to sub class objects.
///Allow tasks to be handled off to any arbitrary object.
///
//
class FirstDelegationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Delegation ♥️"
    }

    @IBAction func detailsButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Delegation", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "SecoundDelegationViewController") as! SecoundDelegationViewController
        viewController.delegate = self
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}

extension FirstDelegationViewController: secoundDelegationViewControllerDelegate {
    func changeBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
