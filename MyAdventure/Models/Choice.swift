//
//  Choice.swift
//  MyAdventure
//
//  Created by Daniel Dye on 2/15/25.
//

import Foundation
//Choice class. Always has text describing the choice, three responses, a hero name that can die as a result of the choice, and a flag that determines if this choice is the end of the adventure. Also stores the next choice in the adventure.
class Choice {
    init(_ textNew: String,_ resultOneNew: String,_ resultTwoNew: String,_ resultThreeNew: String,_ nextChoiceNew: Choice?,_ heroDeadNew: String?,_ isEndNew: Bool) {
        text = textNew
        resultOne = resultOneNew
        resultTwo = resultTwoNew
        resultThree = resultThreeNew
        nextChoice = nextChoiceNew
        heroDead = heroDeadNew
        isEnd = isEndNew
    }
    
    var text: String?
    var resultOne: String?
    var resultTwo: String?
    var resultThree: String?
    var nextChoice: Choice?
    var heroDead: String?
    var isEnd: Bool
    
    func getNext() -> Choice? {
        return nextChoice!
    }
    
    func getText() -> String {
        return text!
    }
    
    func getResult1() -> String {
        return resultOne!
    }
    
    func getResult2() -> String {
        return resultTwo!
    }
    
    func getResult3() -> String {
        return resultThree!
    }
    
    func getHero() -> String {
        return heroDead!
    }
    
    func getEnd() -> Bool {
        return isEnd
    }
    
    func setNext(_ next: Choice) {
        nextChoice = next
    }
    
}
