//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by Eric Tu on 1/1/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gameStateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func pressedNewGame(_ sender: Any) {
        print("New Game")
    }
}

