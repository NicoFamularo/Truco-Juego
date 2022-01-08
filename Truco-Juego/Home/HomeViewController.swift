//
//  HomeViewController.swift
//  Truco-Juego
//
//  Created by Nicolas Famularo on 08/01/2022.
//

import UIKit

class HomeViewController: UIViewController {

//MARK: Variables / Constants
    
    let PlayerA = HomeViewController.Person(mano: 0, score: 0)
    let PlayerB = HomeViewController.Person(mano: 0, score: 0)
    
    var mano:Bool = true    // True = A // False = B //
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//MARK: Function calling
        
        cardListing()
        
        resetGameScore()
        
        pickMano()
        
        print("Mano \(Person.manoNum)")
        
        print("A \(PlayerA.score)")
        print("B \(PlayerB.score)")
        print(mano)
        
    }
    
    
    

    
//MARK: Outlets
    
    @IBOutlet weak var ScoreALabel: UILabel!
    
    
    @IBAction func A1Button(_ sender: Any) {
    }
    
    @IBAction func A2Button(_ sender: Any) {
    }
    
    @IBAction func A3Button(_ sender: Any) {
    }
    
    @IBOutlet weak var ScoreBLabel: UILabel!
    
    
    @IBAction func B1Button(_ sender: Any) {
    }
    
    @IBAction func B2Button(_ sender: Any) {
    }
    
    @IBAction func B3Button(_ sender: Any) {
    }
    
    
//MARK: Actions
    
    
    @IBAction func A1ButtonAction(_ sender: UIButton) {
    
    }
    
    @IBAction func A2ButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func A3ButtonAction(_ sender: UIButton) {
    }
    
    
    @IBAction func B1ButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func B2ButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func B3ButtonAction(_ sender: UIButton) {
    }
    
    
    

}


//MARK: Person (Struct)
extension HomeViewController{
    
    public class Person {
        
        static var manoNum:Int = 0
        
        var score:Int = 0
        
        init(mano:Int, score:Int){
            HomeViewController.Person.manoNum = HomeViewController.Person.manoNum
            self.score = score
        }
        
    }
    
    
}


//MARK: Extensions


extension HomeViewController{
    
    func resetGameScore(){
        PlayerA.score = 0
        PlayerB.score = 5
    }
    
    func pickMano(){
        Person.manoNum = Int.random(in: 2...5)
        
        if Person.manoNum % 2 == 0{
            mano = true
        } else {
            mano = false
        }
            
    }
    
    
    
}




