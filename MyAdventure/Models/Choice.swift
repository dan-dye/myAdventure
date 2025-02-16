//
//  Choice.swift
//  MyAdventure
//
//  Created by Daniel Dye on 2/15/25.
//

import Foundation

class Choice {
    init(_ textNew: String,_ resultOneNew: String,_ resultTwoNew: String,_ resultThreeNew: String,_ nextChoiceNew: Choice?) {
        text = textNew
        resultOne = resultOneNew
        resultTwo = resultTwoNew
        resultThree = resultThreeNew
        nextChoice = nextChoiceNew
    }
    
    var text: String?
    var resultOne: String?
    var resultTwo: String?
    var resultThree: String?
    var nextChoice: Choice?
    
}
