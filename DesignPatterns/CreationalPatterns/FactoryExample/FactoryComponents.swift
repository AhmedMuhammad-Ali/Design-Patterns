//
//  FactoryComponents.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 02/08/2021.
//

import Foundation

// MARK: - JobContactProtocol
/// use to send our customized emails to our potential clients with information on the type of job they are seeking OR recipient status.

///
protocol JobContactProtocol {
    func sendResponseEmail() -> Email?
    func sendRequestResumeEmail() -> Email?
}
// default implementation for `JobContactProtocol`
extension JobContactProtocol {
    func sendResponseEmail() -> Email? { return nil }
    func sendRequestResumeEmail() -> Email? { return nil }
}
// MARK: - Template objects for recipient status

struct iOSDeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    let senderEmail: String

    
    init(contact: Contact, senderEmail: String){
        self.contact = contact
        self.senderEmail = senderEmail
    }
    
    func sendRequestResumeEmail()-> Email? {
        
        let subject = "Thanks for Your Application"
        let body =  "Dear \(contact.name), this is the best time to be an iOS developer! Send me you're resume today! I have job opportunities that pay \(contact.desiredSal) $$$."
        
        return Email(subject: subject, messageBody: body, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}

struct AndroidDeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    let senderEmail: String
    
    init(contact: Contact, senderEmail: String){
        self.contact = contact
        self.senderEmail = senderEmail
    }
    
    func sendRequestResumeEmail()-> Email? {
        
        let subject = "Thanks for Your Application"
        let body = "Dear \(contact.name), this is as decent time to be an Android developer! Send me you're resume today! I have job opportunities that pay close to the \(contact.desiredSal) you are looking for"
        
        return Email(subject: subject, messageBody: body, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}

struct WebDeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    let senderEmail: String

    init(contact: Contact, senderEmail: String){
        self.contact = contact
        self.senderEmail = senderEmail
    }
    
    func sendRequestResumeEmail()-> Email? {
        
        let subject = "Thanks for Your Application"
        let body = "Dear \(contact.name), Send me you're resume today! I have job opportunities for you."
        
        return Email(subject: subject, messageBody: body, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}

struct QADeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    let senderEmail: String

    init(contact: Contact, senderEmail: String){
        self.contact = contact
        self.senderEmail = senderEmail
    }
    func sendRequestResumeEmail()-> Email? {
        
        let subject = "Thanks for Your Application"
        let body = "Dear \(contact.name), The market is tough but the code is still buggy!  Good news for you because I know the best companies for buggy code and they need you!"
        
        return Email(subject: subject, messageBody: body, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}

struct ProductOwnerDeveloperJobSeeker: JobContactProtocol{
    var contact: Contact
    let senderEmail: String
    
    init(contact: Contact, senderEmail: String){
        self.contact = contact
        self.senderEmail = senderEmail
    }
    
    func sendRequestResumeEmail()-> Email? {
        
        let subject = "Thanks for Your Application"
        let body = "Dear \(contact.name), Times are still good to be in development.  Maybe you should consider learning to code or going back to code. If we can cut your desired salary of \(contact.desiredSal) in half, I should be able to place you as a contract to hire. Send me your resume!"
        
        return Email(subject: subject, messageBody: body, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}
// MARK: - Template objects for recipient status
//
struct NewRecipient: JobContactProtocol {
    
    let contact: Contact
    let senderEmail: String
    
    func sendResponseEmail() -> Email? {
        let subject = "We Received Your Application"
        let messageBody = "Dear \(contact.name), Thanks for applying for a \(contact.job) job here! " +
            "You should hear from us in 17-42 business days."
        return Email(subject: subject, messageBody: messageBody, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}


struct InterviewRecipient: JobContactProtocol {
    
    let contact: Contact
    let senderEmail: String
    
    func sendResponseEmail() -> Email? {
        let subject = "We Want to Interview You"
        
        let messageBody = "Dear \(contact.name), Thanks for your resume for a \(contact.job) job here! " +
            "Can you come in for an interview in 30 minutes?"
        return Email(subject: subject, messageBody: messageBody, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}

struct HiredRecipient: JobContactProtocol {
    
    let contact: Contact
    let senderEmail: String
    
    func sendResponseEmail() -> Email? {
        let subject = "We Want to Hire You 🎉 🥳"
        
        let messageBody = "Congratulations, \(contact.name) " +
            "We liked your code, and you smelled nice. " +
            "We want to offer you for a \(contact.job) position! with slary \(contact.desiredSal) $$$"
        
        return Email(subject: subject, messageBody: messageBody, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}

struct RejectedRecipient: JobContactProtocol {
    
    let contact: Contact
    let senderEmail: String
    
    func sendResponseEmail() -> Email? {
        let subject = "Thanks for Your Application"
        
        let messageBody = "Thank you for applying, \(contact.name) " +
            "We have decided to move forward with other candidates. " +
            "Please remember to wear pants next time!"
        
        return Email(subject: subject, messageBody: messageBody, senderEmail: senderEmail, recipientEmail: contact.email)
    }
}
// MARK: -Email Factory
//
struct EmailFactory{
    
    /// Create a response email based on recipient status
    /// - Parameters:
    ///   - contact: Recipient for a job
    ///   - senderEmail: sender email
    /// - Returns: JobContactProtocol
    static func createEmail(contact: Contact, senderEmail: String) -> JobContactProtocol {
        
        switch contact.status {
        case .new:
            return NewRecipient(contact: contact, senderEmail: senderEmail)
        case .interview:
            return InterviewRecipient(contact: contact, senderEmail: senderEmail)
        case .hired:
            return HiredRecipient(contact: contact, senderEmail: senderEmail)
        case .rejected:
            return RejectedRecipient(contact: contact, senderEmail: senderEmail)
        }
    }
    
    ///  create a job seeker email
    /// - Parameters:
    ///   - contact: Recipient for a job
    ///   - senderEmail: sender email
    /// - Returns: JobContactProtocol
    static func getJobSeeker(contact: Contact, senderEmail: String) -> JobContactProtocol {
        switch contact.job {
        case .iOS:
            return iOSDeveloperJobSeeker(contact: contact, senderEmail: senderEmail)
        case .Android:
            return AndroidDeveloperJobSeeker(contact: contact, senderEmail: senderEmail)
        case .Web:
            return WebDeveloperJobSeeker(contact: contact, senderEmail: senderEmail)
        case .QA:
            return QADeveloperJobSeeker(contact: contact, senderEmail: senderEmail)
        case .Product_Owner:
            return ProductOwnerDeveloperJobSeeker(contact: contact, senderEmail: senderEmail)
        }
    }
}

// MARK: - Contact Model
//
struct Contact{
    
    var name: String
    var email: String
    var job: Job
    var status: Status
    var desiredSal: Double
    
    enum Job {
        case iOS
        case Android
        case Web
        case QA
        case Product_Owner
    }
    
    enum Status {
        case new
        case interview
        case hired
        case rejected
    }
}
// MARK: - Email Model

struct Email {
    let subject: String
    let messageBody: String
    let senderEmail: String
    let recipientEmail: String
}
