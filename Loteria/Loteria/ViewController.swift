//
//  ViewController.swift
//  Loteria
//
//  Created by Paolo Prodossimo Lopes on 09/11/21.
//  Copyright © 2021 Leticia de Oliveira Speda. All rights reserved.
//

import UIKit

enum GameType: String {
    case megasena = "Mega-Sena"
    case quina = "Quina"
}

infix operator >-<
func >-< (total: Int, universe: Int) -> [Int] {
    var result: [Int] = []
    while result.count < total {
        let randomNumber = Int (arc4random_uniform(UInt32(universe)) + 1)
        if !result.contains(randomNumber) {
            result.append(randomNumber)
        }
    }
    
    return result.sorted()
}

class ViewController: UIViewController {
    @IBOutlet weak var ibGameType: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    @IBOutlet var balls: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumber(for: .megasena)
       }
    
    func showNumber(for type: GameType ) {
        ibGameType.text = type.rawValue
        var game: [Int] = []
        switch type {
        case.megasena:
            game = 6>-<60
            balls.last?.isHidden = false
        case.quina:
            game = 5>-<80
            balls.last?.isHidden = true
        }
        for (index, game) in game.enumerated(){
            balls[index].setTitle("\(game)", for: .normal)
        }
    }
    
    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumber(for: .megasena)
        default:
            showNumber(for: .quina)
        }
    }
    
    
    
}



