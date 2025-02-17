//
//  ViewController.swift
//  MyAdventure
//
//  Created by Daniel Dye on 2/14/25.
//

import UIKit

class ViewController: UIViewController {

    //UI outlets
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var knightButton: UIButton!
    @IBOutlet weak var wizardButton: UIButton!
    @IBOutlet weak var rogueButton: UIButton!
    @IBOutlet weak var knightImage: UIImageView!
    @IBOutlet weak var wizardImage: UIImageView!
    @IBOutlet weak var rogueImage: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    //Aventure instance
    var adventure = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.setTitle("Continue", for: .normal)
        //Updates the ui to start
        updateUI("Continue")
    }

    //Action for three choice buttons. Uses the button's text to determine response
    @IBAction func choicePress(_ sender: UIButton) {
        //Updates adventure to not wait on a choice
        adventure.choiceWaiting = false

        updateUI(sender.titleLabel!.text!)
        
        //Updates status of third choice with ending based on current score
        adventure.setWin()
        //Progresses the game to the next choice
        adventure.progress()
        
    }
    
    //Action for the continue/play again button
    @IBAction func continuePress(_ sender: UIButton) {
        //If game is in end state, the UI is reset, else acts as continue
        if(adventure.gameOver) {
            resetUI()
            updateUI(sender.titleLabel!.text!)
        } else {
            //Updates adventure to be waiting on choice
            adventure.choiceWaiting = true
            
            //If this is the last choice, put game in end state
            if(adventure.getCurrent().isEnd) {
                adventure.endGame()
            }
            updateUI(sender.titleLabel!.text!)
        }
    }
    
    //Main UI update function
    func updateUI(_ button: String) {
        let choice = adventure.getCurrent()
        //If game is in end state, update UI with victory/defeat ui
        if(adventure.gameOver) {
            contentLabel.text = choice.getText()
            continueButton.isHidden = false;
            continueButton.setTitle("Play Again", for: .normal)
            knightImage.isHidden = true;
            wizardImage.isHidden = true;
            rogueImage.isHidden = true;
            knightButton.isHidden = true;
            wizardButton.isHidden = true;
            rogueButton.isHidden = true;
        } else {
            //if waiting on a choice display choice text and choice buttons
            if (adventure.choiceWaiting) {
                contentLabel.text = choice.getText()
                continueButton.isHidden = true;
                knightImage.isHidden = false;
                wizardImage.isHidden = false;
                rogueImage.isHidden = false;
                knightButton.isHidden = false;
                wizardButton.isHidden = false;
                rogueButton.isHidden = false;

            } else {
                //else display continue button and process choice
                continueButton.isHidden = false;
                knightImage.isHidden = true;
                wizardImage.isHidden = true;
                rogueImage.isHidden = true;
                knightButton.isHidden = true;
                wizardButton.isHidden = true;
                rogueButton.isHidden = true;
                //matches the button choice to choice's 3 responses
                contentLabel.text = matchResponse(button)
                //if the choice is the killhero choice, kill the relevant hero
                if(button == choice.getHero()) {
                    adventure.killHero(button)
                    killButton(button)
                }
            }
        }

        
        
    }
    
    //Updates UI and disables the button for a killed hero
    func killButton(_ name: String) {
        switch name {
        case "Knight":
            knightButton.setTitle(" ", for: .normal)
            knightButton.isEnabled = false
            knightImage.image = UIImage(named: "skull")
            knightButton.layer.opacity = 0.5
        case "Wizard":
            wizardButton.setTitle(" ", for: .normal)
            wizardButton.isEnabled = false
            wizardImage.image = UIImage(named: "skull")
            wizardButton.layer.opacity = 0.5
        case "Rogue":
            rogueButton.setTitle(" ", for: .normal)
            rogueButton.isEnabled = false
            rogueImage.image = UIImage(named: "skull")
            rogueButton.layer.opacity = 0.5
        default:
            break
        }
    }
    
    //Matches the button text to the results for a given choice
    func matchResponse(_ name: String) -> String {
        let choice = adventure.getCurrent()
        switch name {
        case "Knight":
            return choice.getResult1()
        case "Wizard":
            return choice.getResult2()
        case "Rogue":
            return choice.getResult3()
        default:
            return ""
        }
    }
    
    //Resets ui for a new game
    func resetUI() {
        adventure.reset()
        knightButton.setTitle("Knight", for: .normal)
        knightButton.isEnabled = true
        knightImage.image = UIImage(named: "knight")
        knightButton.layer.opacity = 1
        wizardButton.setTitle("Wizard", for: .normal)
        wizardButton.isEnabled = true
        wizardImage.image = UIImage(named: "wizard")
        wizardButton.layer.opacity = 1
        rogueButton.setTitle("Rogue", for: .normal)
        rogueButton.isEnabled = true
        rogueImage.image = UIImage(named: "rogue")
        continueButton.setTitle("Continue", for: .normal)
        rogueButton.layer.opacity = 1
    }

    
}

