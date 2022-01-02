//
//  main.swift
//  Nested_Types
//
//  Created by M_2022814 on 12/15/21.
//

import Foundation

// MARK: - Nested Types
// It can be convenient to define utility classes and structures purely for use within the context of a more complex type. These are called nested types
// Enumerations, classes and structures can be nested types.

struct BlackjackCard {
    
    // nested Suit enumeration
    enum Suit:Character {
        case spades = "s", hearts = "h", diamond = "d", clubs = "c"
    }
    
    // nested Rank enumeration
    enum Rank: Int {
        case two = 2, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king, ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
            switch self {
            case .ace:
                return Values(first: 1, second: 11)
            case .jack, .queen, .king:
                return Values(first: 10, second: nil)
            default:
                return Values(first: self.rawValue, second: nil)
            }
        }
    }
    
    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
        var output = "suit is \(suit.rawValue),"
        output += "value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}

// MARK: - Referring to Nested Types
// To use a nested type outside of its definition context, prefix its name with the name of the type it's nested within:

var heart = BlackjackCard.Suit.hearts; print(heart)
