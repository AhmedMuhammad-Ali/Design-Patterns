//
//  Adapter.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 03/08/2021.
//

import Foundation

///Adapter is a structural design pattern that allows objects with incompatible interfaces to work together. In other words, it transforms the interface of an object to adapt it to a different object.
///So adapter can transform one thing into another, sometimes it's called wrapper, because it wraps the object and provides a new interface around it. It's like a software dongle for specific interfaces or legacy classes. (Dongle haters: it's time to leave the past behind!) 😂
///Another use case is when you have to use several existing final classes or structs but they lack some functionality and you want to build a new target interface on top of them. Sometimes it's a good choice to implement an wrapper to handle this messy situation. 🤷‍♂️

// MARK: - Adapter design pattern implementation
///Creating an adapter in Swift is actually a super easy task to do. You just need to make a new object, "box" the old one into it and implement the required interface on your new class or struct. In other words, a wrapper object will be our adapter to implement the target interface by wrapping an other adaptee object. So again: ⬇️
///
///1️⃣`Adaptee`
/// The object we are adapting to a specific target (eg. old-school USB-A port).
/// 2️⃣`Adapter`
///An object that wraps the original one and produces the new requirements specified by some target interface (this does the actual work, aka. the little dongle above).
///3️⃣ `Target`
///It is the object we want to use adaptee with (our USB-C socket).


// MARK: - Auth service
class GoogleAuthenticator {
    func login(email: String,
               password: String,
               completion: @escaping (GoogleUser?, Error?) -> Void) {
        
        // After make a success call and return with token
        let token = "special token value"
        let user = GoogleUser(email: email, password: password, token: token)
        completion(user, nil)
        
    }
}
// MARK: - Model
struct GoogleUser {
    public var email: String
    public var password: String
    public var token: String
}

struct User {
    public let email: String
    public let password: String
}

struct Token {
    public let value: String
}

protocol AuthenticationServiceProtocol {
    func login(email: String, password: String, success: @escaping (User, Token) -> Void, faliure: @escaping (Error?) -> Void)
}
class GoogleAuthenticatorAdapter: AuthenticationServiceProtocol {
    
    let googleService: GoogleAuthenticator = GoogleAuthenticator()

    func login(email: String, password: String, success: @escaping (User, Token) -> Void, faliure: @escaping (Error?) -> Void) {
        googleService.login(email: email, password: password) { googleUser, error in
            guard let user = googleUser else {
                faliure(error)
                return
            }
            let appUser = User(email: email, password: password)
            let token = Token(value: user.token)
            success(appUser, token)
        }
    }
}
