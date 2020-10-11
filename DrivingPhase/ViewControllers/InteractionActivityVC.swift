//
//  InteractionActivityVC.swift
//  DrivingPhase
//
//  Created by Junaid Zaidi on 04/01/2020.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import UIKit

extension UIView {

    /**
     Rotate a view by specified degrees

     - parameter angle: angle in degrees
     */
    func rotate(angle angle: CGFloat) {
        let radians = angle / 180.0 * CGFloat.pi
        let rotation = self.transform.rotated(by: radians);
        self.transform = rotation
    }
}

class InteractionActivityVC: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet var tapGesture: UITapGestureRecognizer!
    
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet var tap16: UITapGestureRecognizer!
    
    var randomNumber : Int = 0
    var untouchedFlag : Bool = true
    var correctCount : Int = 0
    var changeVC : Bool = false
    var caseNumber : Int = 0
    var activityChange : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.rotate(angle: 45)
        randomNumber = Int.random(in: 1...16)
        if let view = mainView.viewWithTag(randomNumber){
            view.backgroundColor = UIColor.white
        }
        continueBtn.layer.cornerRadius = 10
        continueBtn.clipsToBounds = true
        continueBtn.layer.borderColor = UIColor.black.cgColor
        continueBtn.layer.borderWidth = 0.3
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
       changeActivity()
    }
    @IBAction func tap16Gen(_ sender: UITapGestureRecognizer) {
        
        if(untouchedFlag){
            perform(#selector(stopActivity), with: nil, afterDelay: 20)
            untouchedFlag = false
        }
        if(sender.view?.tag == randomNumber && !changeVC){
            var view = mainView.viewWithTag(randomNumber)
            view?.backgroundColor = UIColor.clear
            randomNumber = Int.random(in: 1...16)
            view = mainView.viewWithTag(randomNumber)
            view?.backgroundColor = UIColor.white
            correctCount += 1
        }
        if(correctCount == 27){
            stopActivity()
        }
    }
    
    @objc func stopActivity(){
        changeVC = true
        let view = mainView.viewWithTag(randomNumber)
        view?.backgroundColor = UIColor.clear
        print(correctCount)
        perform(#selector(changeActivity), with: nil, afterDelay: 2)
    }
    
    @objc func changeActivity(){
        if(activityChange == false){
            activityChange = true
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "InteractionActivity2VC") as? InteractionActivity2VC ?? InteractionActivity2VC()
            
            if(correctCount >= 25){
                vc.caseNumber = self.caseNumber
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else if(correctCount >= 21){
                vc.caseNumber = 2
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC ?? ResultVC()
                vc.caseNumber = 3
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
}
