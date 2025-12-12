//
//  CodeBreaker.swift
//  CodeBreaker
//
//  Created by jatin foujdar on 12/12/25.
//

import Foundation
import SwiftUI

typealias Peg = Color


struct CodeBreaker{
    var masterCode: Code = Code(kind: .master)
    var guess: Code = Code(kind: .guess)
    var attempts: [Code] = [Code]()
    let pegChoices: [Peg] = [.red, .green, .blue, .yellow]
    
}

struct Code{
    var kind: Kind
    var pegs: [Peg] = [.green, .red, .red, .yellow]
    
    
    enum Kind{
        case master
        case guess
        case attempt
        case unknown
    }
}


