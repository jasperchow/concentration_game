//
//  Concentration.swift
//  Concentration
//
//  Created by Lexuan Zhou on 2019-05-14.
//  Copyright © 2019 Lexuan Zhou. All rights reserved.
//

import Foundation
import UIKit

class Concentration
{
    
    var randoms = ["⚠️", "🉑", "🈲", "🔞", "🚷", "🈯️", "🚸", "🔱", "🏧", "〽️"]
    var animals = ["🐶", "🐱", "🐭", "🐼", "🐷", "🐸", "🐵", "🦊", "🐯", "🐨"]
    var fruits = ["🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🍈", "🍒"]
    var foods = ["🥯", "🍟", "🍣" , "🍢" ,"🍭" , "🥮", "🍱", "🌮", "🥨" ,"🥐"]
    var sports = ["🥎", "🚴‍♀️", "⛳️", "🏀", "🎱" ,"🏈", "🏹", "⚾️", "🏊‍♂️", "🏸"]
    var faces = ["😋", "😝", "🤪", "🤩", "😏", "🤣", "😅", "😚", "🤨", "🧐"]

    var emojis : [String]
    
    var cards = [Card]()
    // Optional type, Good case to use, only takes care of 1 card face on
    var indexOfOnAndOnlyFaceUpCard: Int?
    var indexDict : [Int : Int] = [:]
    var score : Int
    var flipCount : Int
    var timeFlag = false
    var backgroundColorDict: [[String] : [UIColor]]
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched{
            
            flipCount += 1
            
            if let matchIndex = indexOfOnAndOnlyFaceUpCard, matchIndex != index{
                let indexDictKeys = Array(indexDict.keys)
                if !indexDictKeys.contains(index){
                    indexDict[index] = 1
                    
                }
                else{
                    indexDict[index] =  indexDict[index]! + 1
                }
                if !indexDictKeys.contains(matchIndex){
                    indexDict[matchIndex] = 1
                }
                else{
                    indexDict[matchIndex] = indexDict[matchIndex]! + 1
                }
                
                // Finds out the matched two cards and sets the isMatched variable to true
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                    score += 2
                    if indexDict.keys.contains(matchIndex){
                        indexDict.removeValue(forKey: matchIndex)
                    }
                    if indexDict.keys.contains(index){
                        indexDict.removeValue(forKey: index)
                    }
                   
                }
                else{
                    if indexDict[index]! > 1{
                        score -= 1
                    }
                    if indexDict[matchIndex]! > 1{
                        score -= 1
                    }
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
        var themes = [randoms, animals, fruits, foods, sports, faces]
        themes.shuffle()
        emojis = themes[0]
        indexDict.removeAll()
        score = 0
        flipCount = 0
        backgroundColorDict = [randoms : [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)], animals: [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)], fruits:[#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)], foods: [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1),#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)], sports: [#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1),#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)], faces:[#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1),#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)]]
        
    }
}

