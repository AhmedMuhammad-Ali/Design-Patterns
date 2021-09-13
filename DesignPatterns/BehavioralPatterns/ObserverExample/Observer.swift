//
//  Observer.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 14/09/2021.
//

import Foundation

protocol ObserverProtocol {

    var id : Int { get set }
    func onValueChanged(_ value: Any?)
}
