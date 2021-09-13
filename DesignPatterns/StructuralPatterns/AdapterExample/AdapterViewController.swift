//
//  AdapterViewController.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 03/08/2021.
//

import UIKit

class AdapterViewController: UIViewController {

    // MARK: - Properties
    let authService: AuthenticationServiceProtocol =  GoogleAuthenticatorAdapter()
    override func viewDidLoad() {
        super.viewDidLoad()
        authService.login(email: "AhmedAli@gmail.com", password: "12345678") { user, token in
            print("rreturned user email 🥳 -> \(user.email)")
            print("rreturned user token 🥳 -> \(token)")

        } faliure: { error in
            print("please try agin later 🤒")
        }

    }
}
