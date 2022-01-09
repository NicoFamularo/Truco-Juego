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
        
        resetGameScore()
        
        pickMano()
        
        print("Mano \(Person.manoNum)")
        
        print("A \(PlayerA.score)")
        print("B \(PlayerB.score)")
        print(mano)
        
        print(cardsShuffle())
        print("----------------------")
    }
    
    
    

    
//MARK: Outlets
    
    @IBOutlet weak var ScoreALabel: UILabel!
    
    
    @IBAction func A1Button(_ sender: Any) {
        print(cardsShuffle())
        
        print("----------------------")
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
    
    
    @IBOutlet weak var ManoImage: UIImageView!
    
    
    
    
//MARK: Buttons actions
    
    
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


//MARK: Person (Class)
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
        PlayerB.score = 0
        pickMano()
    }
    
    func pickMano(){
        Person.manoNum = Int.random(in: 1...40)
        
        if Person.manoNum % 2 == 0{
            mano = true
            ManoImage.image = UIImage(systemName: "arrow.up")
        } else {
            mano = false
            ManoImage.image = UIImage(systemName: "arrow.down")
        }
            
    }
    
    func cardsShuffle() -> [Int : Dictionary<String, Int>.Element] {

        let a1Card = cardListing().randomElement()!
        
        let b1Card = cardListing().randomElement()!
        
        
        
        let a2Card = cardListing().randomElement()!
        let a3Card = cardListing().randomElement()!

        
        let b2Card = cardListing().randomElement()!
        let b3Card = cardListing().randomElement()!
        
        
        var deck = [1:a1Card, 2:b1Card, 3:a2Card, 4:b2Card, 5:a3Card, 6:b3Card]
        
        
        for index in 1...6 {
            
            deck[index] = cardListing().randomElement()!
            
            
            if index != 1 {
                
                func check(){
                
                    for index2 in 1...(index-1) {
                            
                        if deck[index]!.value == deck[index2]!.value {
                            
                            func pickOther(){
                                
                                print("repetido")
                                deck[index] = cardListing().randomElement()!
                                
                                check()
                            }
                            
                            pickOther()
                            
                        }
                                
                    }
                        
                }
                
                check()
                                
            }
        }
        return deck
    }
        
        
        
}
    
    
    





