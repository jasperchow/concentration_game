//
//  Card.swift
//  Concentration
//
//  Created by Lexuan Zhou on 2019-05-14.
//  Copyright © 2019 Lexuan Zhou. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUP = false
    var isMatched = false
    var identifier : Int
    
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int{
        
        // Equivalent to Card.identifierFactory
        Card.identifierFactory += 1
        return Card.identifierFactory
    }
    
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
