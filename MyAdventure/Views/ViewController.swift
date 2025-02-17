//
//  ViewController.swift
//  MyAdventure
//
//  Created by Daniel Dye on 2/14/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var knightButton: UIButton!
    @IBOutlet weak var wizardButton: UIButton!
    @IBOutlet weak var rogueButton: UIButton!
    @IBOutlet weak var knightImage: UIImageView!
    @IBOutlet weak var wizardImage: UIImageView!
    @IBOutlet weak var rogueImage: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    
    var adventure = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.setTitle("Continue", for: .normal)
        updateUI("Continue")
    }

    @IBAction func choicePress(_ sender: UIButton) {
        adventure.choiceWaiting = false
        updateUI(sender.titleLabel!.text!)
        adventure.setWin()
        adventure.progress()
        
    }
    
    @IBAction func continuePress(_ sender: UIButton) {
        if(adventure.gameOver) {
            resetUI()
            updateUI(sender.titleLabel!.text!)
        } else {
            adventure.choiceWaiting = true
            if(adventure.getCurrent().isEnd) {
                adventure.endGame()
            }
            updateUI(sender.titleLabel!.text!)
        }
    }
    
    func updateUI(_ button: String) {
        let choice = adventure.getCurrent()
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
                continueButton.isHidden = false;
                knightImage.isHidden = true;
                wizardImage.isHidden = true;
                rogueImage.isHidden = true;
                knightButton.isHidden = true;
                wizardButton.isHidden = true;
                rogueButton.isHidden = true;
                contentLabel.text = matchResponse(button)
                if(button == choice.getHero()) {
                    adventure.killHero(button)
                    killButton(button)
                }
            }
        }

        
        
    }
    
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

