//
//  SingletonExample.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 28/07/2021.
//

import Foundation
/// `Singleton`
///Singleton is a design pattern that is very popular in development. Most of the developers are using this design pattern. This is very simple, common and easy to use in your project. It initializes your class instance single time only with static property and it will share your class instance globally.
///The singleton pattern restricts a class to only one instance
///When should you use it?
/// ➡️ Use the singleton pattern when having more than one instance of a class would cause problems
///Use the singleton plus pattern if a shared instance is useful most of the time, but you also want to allow custom instances to be created
/// singleton plus means make public init instead of private
/// An example of this is FileManager, which handles everything to do with filesystem access. There is a “default” instance which is a singleton, or you can create your own. You would usually create your own if you’re using it on a background thread.
///

// MARK: - Singleton pluse
//
class Singleton {
    static let sharedInstance = Singleton()
}

// MARK: - Singleton true
///
///If you need to perform additional setup beyond initialization, you can assign the result of the invocation of a closure to the global constant:
///
class Singleton2 {
    static let sharedInstance: Singleton2 = {
        let instance = Singleton2()
        // setup code
        return instance
    }()
    
    private init() {}
}
