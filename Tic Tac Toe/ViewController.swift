//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Noah Rubin on 7/5/18.
//  Copyright © 2018 Noah Rubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var gridLabel0: GridLabel!
    @IBOutlet weak var gridLabel1: GridLabel!
    @IBOutlet weak var gridLabel2: GridLabel!
    @IBOutlet weak var gridLabel3: GridLabel!
    @IBOutlet weak var gridLabel4: GridLabel!
    @IBOutlet weak var gridLabel5: GridLabel!
    @IBOutlet weak var gridLabel6: GridLabel!
    @IBOutlet weak var gridLabel7: GridLabel!
    @IBOutlet weak var gridLabel8: GridLabel!
    @IBOutlet weak var winnerLabel: UILabel!
    @IBOutlet weak var xWinsLabel: UILabel!
    @IBOutlet weak var oWinsLabel: UILabel!
    @IBOutlet weak var tiesLabel: UILabel!
    
    var labelsArray = [GridLabel]()
    var xTurn = true
    var winner = ""
    
    var xWins = 0
    var oWins = 0
    var ties = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerLabel.text = "The winner is : "
        labelsArray.append(gridLabel0)
        labelsArray.append(gridLabel1)
        labelsArray.append(gridLabel2)
        labelsArray.append(gridLabel3)
        labelsArray.append(gridLabel4)
        labelsArray.append(gridLabel5)
        labelsArray.append(gridLabel6)
        labelsArray.append(gridLabel7)
        labelsArray.append(gridLabel8)
        
        for label in labelsArray{
            label.text = ""
            label.textColor = .black
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func resetButton(_ sender: Any) {
        for label in labelsArray{
            label.text = ""
            label.textColor = .black
        }
    }
    
    @IBAction func onTappedGridLabel(_ sender: UITapGestureRecognizer) {
        //print("TAPPED")
        for label in labelsArray {
            if label.frame.contains(sender.location(in: backgroundView)){
                if(label.text == ""){
                    //place a piece
                    if(xTurn){ label.text = "X"}
                    else { label.text = "0"}
                    //switch turns
                    xTurn = !xTurn
                    //check for a winner and check
                    winner = check()
                    //winner is X
                    if( winner == "X") {
                        winnerLabel.text = "The winner is : X"
                        for label in labelsArray{ label.text = "X"}
                        xTurn = true
                        xWins += 1
                        xWinsLabel.text = "X Wins: \(xWins)"
                    }
                    else if( winner == "0") {
                        winnerLabel.text = "The winner is : 0"
                        for label in labelsArray{ label.text = "0"}
                        oWins += 1
                        oWinsLabel.text = "0 Wins: \(oWins)"
                    }
                    else{ winnerLabel.text = "The winner is : "
                        
                    }
                    //cats game is true
                    var flag = true
                    for label in labelsArray{
                        if(label.text == ""){ flag = false }
                    }
                    if(winnerLabel.text == "The winner is : " && flag){winnerLabel.text = "The winner is : Cats"
                        ties += 1
                        tiesLabel.text = "Ties: \(ties)"
                    }
                }
            }
        }
    }
    
    func check() -> String {
        var winner = ""
        let checkedCombos = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]
        for combo in checkedCombos{
            winner = checkCombo(combo: combo)
            if (winner != ""){
                return winner
            }
        }
        
        return winner
    }
    
    func checkCombo(combo: [Int]) -> String {
        if(labelsArray[combo[0]].text! == labelsArray[combo[1]].text! && labelsArray[combo[1]].text! == labelsArray[combo[2]].text!) && labelsArray[combo[0]].text != ""{
            print (labelsArray[combo[0]])
            labelsArray[combo[0]].textColor = .white
            labelsArray[combo[1]].textColor = .white
            labelsArray[combo[2]].textColor = .white
            return labelsArray[combo[0]].text!
     } else{
        return ""
    }
    
    }
}
