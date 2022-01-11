//
//  FirstViewController.swift
//  Truco-Juego
//
//  Created by Nicolas Famularo on 10/01/2022.
//

import UIKit





class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var StartButton: UIButton!
    
    @IBAction func StartButtonAction(_ sender: UIButton) {
        
//        let rootVC = HomeViewController()
//
//        let navVC = UINavigationController(rootViewController: rootVC)
//        navVC.modalPresentationStyle = .fullScreen
//
//        present(navVC, animated: true)
        
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
}
