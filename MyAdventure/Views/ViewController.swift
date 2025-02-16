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
    
    let adventure = AdventureLogic()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func choicePress(_ sender: UIButton) {
    }
    
    @IBAction func continuePress(_ sender: UIButton) {
    }
    
    
}

