//
//  adventureLogic.swift
//  MyAdventure
//
//  Created by Daniel Dye on 2/16/25.
//

import Foundation

struct AdventureLogic {
    var knightAlive = true
    var wizardAlive = true
    var rogueAlive = true
    
    var start: Choice = Choice("A party of adventurers led by a Knight, a Wizard, and a Rogue make their way through a dungeon and attempt to claim its legendary treasure. They reach a solid stone door with a number of symbols on its surface. Choose a hero to try and get through the door.",
    "As the Knight attempts to lift the door open with brute strength, the sound of the door opening alerts a nearby group of Goblins who descend on the party. The Knight is able to hold the door open long enough for the others to slip inside, but the Knight remains trapped on the other side. The party can only listen as he is cut down by the Goblins.",
    "The Wizard studies the ancient symbols on the door and is able to decipher their meaning. He uses the required spell to magically open the door allowing the party to pass through to the other side.",
    "The Rogue climbs the rock wall surrounding the door and near the top finds a narrow tunnel leading to the other side of the door. On the other side he finds a pulley system to open the door for the others", nil)
}
