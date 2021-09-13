//
//  Observable.swift
//  DesignPatterns
//
//  Created by Ahmed Ali on 14/09/2021.
//

import Foundation

protocol ObservableProtocol : class {
    var observers : [ObserverProtocol] { get set }

    func addObserver(_ observer: ObserverProtocol)
    func removeObserver(_ observer: ObserverProtocol)
    func notifyObservers(_ observers: [ObserverProtocol])
}
