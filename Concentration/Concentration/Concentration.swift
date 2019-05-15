//
//  Concentration.swift
//  Concentration
//
//  Created by Lexuan Zhou on 2019-05-14.
//  Copyright © 2019 Lexuan Zhou. All rights reserved.
//

import Foundation

class Concentration
{
    
    var cards = [Card]()
    // Optional type, Good case to use, only takes care of 1 card face on
    var indexOfOnAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched{
            if let matchIndex = indexOfOnAndOnlyFaceUpCard, matchIndex != index{
                
                // Finds out the matched two cards and sets the isMatched variable to true
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUP = true
                indexOfOnAndOnlyFaceUpCard = nil
            }
            else
            {
                // either no two cards or 2 cards are face up
                for flipDownIndex in 0 ..< cards.count{
                    cards[flipDownIndex].isFaceUP = false
                }
                
                cards[index].isFaceUP = true
                indexOfOnAndOnlyFaceUpCard = index
            }
        }
    }
    
    init(numberOfPairsOfCards: Int)
    {
        // _ for never used iteration objects
        for _ in 1 ... numberOfPairsOfCards{
            let card = Card()
            // Equivalent to cards.append(card) twice, with two different cards in memory
            cards += [card,card]
        }
        
        // Shuffles the cards
        cards.shuffle()
    }
}
