//
//  InteractionActivity3VC.swift
//  DrivingPhase
//
//  Created by muhammadnoman on 1/8/20.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import UIKit

class InteractionActivity3VC: UIViewController {

    @IBOutlet weak var circleView: CustomView!
    @IBOutlet weak var continueBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.layer.cornerRadius = 10
        continueBtn.clipsToBounds = true
        continueBtn.layer.borderColor = UIColor.black.cgColor
        continueBtn.layer.borderWidth = 0.3
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dissapearColor()
    }

  @IBAction func tap16Gen(_ sender: UITapGestureRecognizer) {
    if(sender.view?.backgroundColor == UIColor.yellow){
        sender.view?.backgroundColor = UIColor.systemIndigo
        dissapearColor()
        }
        let a = "abc"
        if a == "a"{
            return
        }
        else if a == "b"{
            return
        }
        else{
            return
        }
    
    }
    
    func dissapearColor(){
        let randomNumber : Double = Double(Int.random(in: 0...3)) * 1.0
        DispatchQueue.main.asyncAfter(deadline: .now() + randomNumber){
            self.circleView.backgroundColor = UIColor.yellow
        }
    }

}
