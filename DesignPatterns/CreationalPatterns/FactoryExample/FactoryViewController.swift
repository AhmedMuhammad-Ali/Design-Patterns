//
//  FactoryViewController.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 02/08/2021.
//

import UIKit

class FactoryViewController: UIViewController {
    // MARK: - Properties
    //
    // MARK: - Life cycle
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }
     
    
    // MARK: -IBActions
    //
    @IBAction func interviewButtonTapped(_ sender: Any) {
        
        let interviewContact = Contact(name: "Ahmed Ali", email: "ahmed@gmail.com", job: .iOS, status: .interview, desiredSal: 100)
       let email =  EmailFactory.createEmail(contact: interviewContact, senderEmail: "hr@gmail.com")
        print(email.sendResponseEmail()?.messageBody ?? "Not found !!")
    }
    @IBAction func hiredButtonTapped(_ sender: Any) {
        
        let hiredContact = Contact(name: "Ahmed Amin", email: "amin@gmail.com", job: .iOS, status: .hired, desiredSal: 200)
       let email =  EmailFactory.createEmail(contact: hiredContact, senderEmail: "hr@gmail.com")
        print(email.sendResponseEmail()?.messageBody ?? "Not found !!")
    }
    @IBAction func rejectedButtonTapped(_ sender: Any) {
        
        let hiredContact = Contact(name: "Sayed abdel hafez", email: "sayed@gmail.com", job: .QA, status: .rejected, desiredSal: 300)
       let email =  EmailFactory.createEmail(contact: hiredContact, senderEmail: "hr@gmail.com")
        print(email.sendResponseEmail()?.messageBody ?? "Not found !!")
    }
    
    // sendRequestResumeEmail
    @IBAction func webButtonTapped(_ sender: Any) {
        
        let hiredContact = Contact(name: "Ramy Elbanna", email: "ramy@gmail.com", job: .Web, status: .hired, desiredSal: 400)
       let email =  EmailFactory.getJobSeeker(contact: hiredContact, senderEmail: "hr@gmail.com")
        print(email.sendRequestResumeEmail()?.messageBody ?? "Not found !!")
    }
    @IBAction func iOSButtonTapped(_ sender: Any) {
        let hiredContact = Contact(name: "Ahmed Mohamed Ali Amin", email: "ahmedali@gmail.com", job: .iOS, status: .hired, desiredSal: 500)
       let email =  EmailFactory.getJobSeeker(contact: hiredContact, senderEmail: "hr@gmail.com")
        print(email.sendRequestResumeEmail()?.messageBody ?? "Not found !!")
    }
    @IBAction func qaButtonTapped(_ sender: Any) {
        
        let hiredContact = Contact(name: "Nadia Osman", email: "nadia@gmail.com", job: .QA, status: .hired, desiredSal: 200)
       let email =  EmailFactory.getJobSeeker(contact: hiredContact, senderEmail: "hr@gmail.com")
        print(email.sendRequestResumeEmail()?.messageBody ?? "Not found !!")
    }
}
