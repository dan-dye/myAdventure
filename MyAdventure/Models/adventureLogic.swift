//
//  adventureLogic.swift
//  MyAdventure
//
//  Created by Daniel Dye on 2/16/25.
//

import Foundation

struct AdventureLogic {
    init() {
        goodEnd = Choice("The surviving party members discover the lost treasure horde deep in the dungeon. Now now they must carry it all to the surface!", "", "", "", firstChoice, "", true)
        badEnd = Choice("As the last hero in the party falls. The surviving party members are lost to the depths and never heard from again.", "", "", "", firstChoice, "", true)
        thirdChoice = Choice("The party comes upon a large cavern where a dragon is sleeping in front of the exit on the other side. One of the party must distract the dragon while the others sneak through the exit. Who will distract the dragon?", "The Knight runs forward shouting and banging his shield. The dragon stands up allowing the remaining party members to sneak under its legs through the exit. The dragon breathes fire into the cavern but the Knight is able to protect himself with his shield. He then is able to run through the exit unscathed.", "The Wizard runs forward shooting magic bolts at the dragon’s face. The dragon stands up allowing the remaining party members to sneak under its legs through the exit. The dragon breathes fire into the cavern but the Wizard is able to protect himself with a magical barrier. He then is able to run through the exit unscathed.", "The Rogue runs forward and shoots arrows at the dragon’s face. The dragon stands up allowing the remaining party members to sneak under its legs through the exit. The dragon breathes fire into the cavern and the Rogue is burned to a crisp.", goodEnd, "Rogue", false)
        secondChoice = Choice("The group comes upon a long dark tunnel with many skeletons of past adventurers strewn about the floor. Who will go first down the tunnel?", "The Knight leads the way and the party slowly makes its way through the hallway. About halfway through, the Knight steps on a loose stone and a metal spiked trap, springs out from the side wall. Luckily the spike bounces off the Knight’s shield harmlessly and the party is able to avoid and future traps.", "The Wizard leads the way and the party slowly makes its way through the hallway. About halfway through, the Wizard steps on a loose stone and a metal spiked trap, springs out from the side wall, killing the Wizard instantly.", "The Rogue leads the way and the party slowly makes its way through the hallway. About halfway through, the Rogue spots loose stone on the floor and realizes there is a loaded trap in the wall. The Rogue is able to navigate around the remaining traps and reach the other side.", thirdChoice, "Wizard", false)
        firstChoice = Choice("A party of adventurers led by a Knight, a Wizard, and a Rogue make their way through a dungeon and attempt to claim its legendary treasure. They reach a solid stone door with a number of symbols on its surface. Choose a hero to try and get through the door.",
        "As the Knight attempts to lift the door open with brute strength, the sound of the door opening alerts a nearby group of Goblins who descend on the party. The Knight is able to hold the door open long enough for the others to slip inside, but the Knight remains trapped on the other side. The party can only listen as he is cut down by the Goblins.",
        "The Wizard studies the ancient symbols on the door and is able to decipher their meaning. He uses the required spell to magically open the door allowing the party to pass through to the other side.",
        "The Rogue climbs the rock wall surrounding the door and near the top finds a narrow tunnel leading to the other side of the door. On the other side he finds a pulley system to open the door for the others", secondChoice, "Knight", false)
        current = firstChoice
    }

    var knightAlive = true
    var wizardAlive = true
    var rogueAlive = true
    
    var choiceWaiting = true
    var gameOver = false
    
    var current: Choice?
    var firstChoice: Choice?
    var secondChoice: Choice?
    var thirdChoice: Choice?
    var goodEnd: Choice?
    var badEnd: Choice?
    
    func getCurrent() -> Choice {
        return current!
    }
    
    func getChoiceWaiting() -> Bool {
        return choiceWaiting
    }
    
    mutating func progress() {
        current! = current!.getNext()!
    }
    
    mutating func setChoiceWaiting(_ bool: Bool) {
        choiceWaiting = bool
    }
    
    mutating func killHero(_ hero: String) {
        switch hero {
        case "Knight":
            knightAlive = false
        case "Wizard":
            wizardAlive = false
        case "Rogue":
            rogueAlive = false
        default:
            break
        }
    }
    
    func checkWin() -> Bool {
        var score = 0
        if(knightAlive) {score += 1}
        if(wizardAlive) {score += 1}
        if(rogueAlive) {score += 1}
        if(score > 0) {
            return true}
        else {
            return false}
    }
    
    func setWin() {
        if(checkWin()) {thirdChoice!.setNext(goodEnd!)}
        else {thirdChoice!.setNext(badEnd!)}
    }
    
    mutating func reset() {
        current = firstChoice
        gameOver = false
        choiceWaiting = true
        knightAlive = true
        wizardAlive = true
        rogueAlive = true
    }
    
    mutating func endGame() {
        gameOver = true
    }
    

}
