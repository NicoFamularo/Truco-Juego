//
//  HomeViewController.swift
//  Truco-Juego
//
//  Created by Nicolas Famularo on 08/01/2022.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    //MARK: Outlets
        
        @IBOutlet weak var ScoreALabel: UILabel!
        
        
        @IBOutlet weak var A1Button: UIButton!
        
        
        @IBOutlet weak var A2Button: UIButton!
        
        
        @IBOutlet weak var A3Button: UIButton!
        
        
        @IBOutlet weak var ScoreBLabel: UILabel!
        
        
        @IBOutlet weak var B1Button: UIButton!
        
        
        @IBOutlet weak var B2Button: UIButton!
        
        
        @IBOutlet weak var B3Button: UIButton!
        
        
        @IBOutlet weak var ManoImage: UIImageView!
        
        
        @IBOutlet weak var StartButton: UIButton!

//MARK: Variables / Constants
    
    let PlayerA = HomeViewController.Person(mano: 0, score: 0)
    let PlayerB = HomeViewController.Person(mano: 0, score: 0)
    
    var mano: Bool = true    // True = A // False = B //
    
    var a1card: Dictionary<String, Int>.Element? = nil
    var a2card: Dictionary<String, Int>.Element? = nil
    var a3card: Dictionary<String, Int>.Element? = nil
    var b1card: Dictionary<String, Int>.Element? = nil
    var b2card: Dictionary<String, Int>.Element? = nil
    var b3card: Dictionary<String, Int>.Element? = nil
    
    var deck: [Int : Dictionary<String, Int>.Element]? = nil
    
    
    
    
    //MARK: Function calling
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTitlesConfigurations()
        
        resetGameScore()
        
        pickFirstMano()
        
        print("Mano \(Person.manoNum)")
        
        print("A \(PlayerA.score)")
        print("B \(PlayerB.score)")
        print(mano)
        
        print("----------------------")
    }
    
    //MARK: Set Screen Init
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    

    
    
    
    
//MARK: Buttons actions
    
    
    @IBAction func StartButtonAction(_ sender: Any) {
        
        
        print("----------------------")
        
        deck = cardsShuffle()
        
        a1card = deck![1]
        b1card = deck![2]
        a2card = deck![3]
        b2card = deck![4]
        a3card = deck![5]
        b3card = deck![6]

        print(a1card!.key)
        print(a2card!.key)
        print("\(a3card!.key) \n")
        
        print(b1card!.key)
        print(b2card!.key)
        print(b3card!.key)

        pickAnyMano()
        
        setCardTitles()
        
        showGameScore()
        
        print("----------------------")
    }
    
    
    @IBAction func A1ButtonAction(_ sender: UIButton) {
        A1Button.setTitle("A1", for: .normal)
        
    }
    
    @IBAction func A2ButtonAction(_ sender: UIButton) {
        A2Button.setTitle("A2", for: .normal)
    }
    
    @IBAction func A3ButtonAction(_ sender: UIButton) {
        A3Button.setTitle("A3", for: .normal)
    }
    
    
    @IBAction func B1ButtonAction(_ sender: UIButton) {
        B1Button.setTitle("B1", for: .normal)
    }
    
    @IBAction func B2ButtonAction(_ sender: UIButton) {
        B2Button.setTitle("B2", for: .normal)
    }
    
    @IBAction func B3ButtonAction(_ sender: UIButton) {
        B3Button.setTitle("B3", for: .normal)
        
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
    
    
    //MARK: Score
    
    func resetGameScore(){
        PlayerA.score = 0
        PlayerB.score = 0
        pickFirstMano()
    }
    
    
    func showGameScore(){
        
        ScoreALabel.text = "\(PlayerA.score)"
        ScoreBLabel.text =  "\(PlayerB.score)"
        
    }
    
    
    
    
    
    
    
    //MARK: Manos
    
    func pickFirstMano(){
        Person.manoNum = Int.random(in: 1...40)
        
        if Person.manoNum % 2 == 0{
            mano = true
            ManoImage.image = UIImage(systemName: "arrow.up")
        } else {
            mano = false
            ManoImage.image = UIImage(systemName: "arrow.down")
        }
        
    }
    
    func pickAnyMano(){
        
        mano.toggle()

        if mano == true {
            
            ManoImage.image = UIImage(systemName: "arrow.up")
            
        } else {
            
            ManoImage.image = UIImage(systemName: "arrow.down")
            
        }
        
    }
    
    
    
    //MARK: Cards Suffle
    
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
    
    
//MARK: Set Titles

extension HomeViewController {
        
    
    func setCardTitles(){
        A1Button.setTitle(a1card!.key, for: .normal)
        A2Button.setTitle(a2card!.key, for: .normal)
        A3Button.setTitle(a3card!.key, for: .normal)
        
        
        B1Button.setTitle(b1card!.key, for: .normal)
        B2Button.setTitle(b2card!.key, for: .normal)
        B3Button.setTitle(b3card!.key, for: .normal)
    }
    
    func setTitlesConfigurations(){
        
        let buttonsList = [A1Button, A2Button, A3Button, B1Button, B2Button, B3Button]
        
        for index in buttonsList{
            index?.titleLabel?.numberOfLines = 2
            index?.titleLabel?.adjustsFontSizeToFitWidth = true
            index?.titleLabel?.textAlignment = .center
        }
        
        ScoreALabel.adjustsFontSizeToFitWidth = true
        ScoreALabel.textAlignment = .center
        
        ScoreBLabel.adjustsFontSizeToFitWidth = true
        ScoreBLabel.textAlignment = .center
        
        
    }
    
    
    
    
}





