//
//  StrategyMainConcepts.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 28/07/2021.
//

import Foundation

// What
protocol LoggerStrategy {
    func log(_ message: String)
}

//Who
struct Logger {
    
    // MARK: - Properties
    //
    let strategy: LoggerStrategy
    
    func log(_ message: String) {
        strategy.log(message)
    }
}

// How
struct LowercaseStrategy: LoggerStrategy {
    func log(_ message: String) {
        print(message.lowercased())
    }
}

struct UppercasedStrategy: LoggerStrategy {
    func log(_ message: String) {
        print(message.uppercased())
    }
}

struct CapitalizedStrategy: LoggerStrategy {
    func log(_ message: String) {
        print(message.capitalized)
    }
}
