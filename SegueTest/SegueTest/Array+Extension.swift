//
//  Array+Extension.swift
//  SegueTest
//
//  Created by Mark Beussink on 20180120.
//

import Foundation

public extension Array {
    func element(at index: Int) -> Element? {
        if self.count < index && index >= 0 {
            return self[index]
        } else {
            return nil
        }
    }
    
    
}
