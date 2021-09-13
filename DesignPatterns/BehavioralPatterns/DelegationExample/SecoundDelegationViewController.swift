//
//  SecoundDelegationViewController.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 27/07/2021.
//

import UIKit


protocol secoundDelegationViewControllerDelegate: AnyObject {
    func changeBackgroundColor(_ color: UIColor)
}

class SecoundDelegationViewController: UIViewController {

    // MARK: - Properties
    //
    weak var delegate: secoundDelegationViewControllerDelegate?
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    // MARK: - IBActions
    //
    @IBAction func greenButtonTapped(_ sender: Any) {
        view.backgroundColor = .green
        delegate?.changeBackgroundColor(.green)
    }
    @IBAction func yellowButtonTapped(_ sender: Any) {
        view.backgroundColor = .yellow
        delegate?.changeBackgroundColor(.yellow)

    }
}
