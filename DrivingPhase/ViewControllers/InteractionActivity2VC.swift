//
//  InteractionActivity2VC.swift
//  DrivingPhase
//
//  Created by muhammadnoman on 1/7/20.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import UIKit

class InteractionActivity2VC: UIViewController {

    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var viewTag2: CustomView!
    @IBOutlet weak var viewTag3: CustomView!
    @IBOutlet weak var viewTag4: CustomView!
    @IBOutlet weak var viewTag6: CustomView!
    @IBOutlet weak var viewTag8: CustomView!
    
    @IBOutlet weak var disableTouchView: UIView!
    var initialViews : [CustomView] = []
    var viewSequence : [CustomView] = []
    var randomNumber : Int = 0
    var correctCount : Int = 0
    var incorrectCount : Int = 0
    var caseNumber : Int = 0
    var untouchedFlag : Bool = true
    var activityChange : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.layer.cornerRadius = 10
        continueBtn.clipsToBounds = true
        continueBtn.layer.borderColor = UIColor.black.cgColor
        continueBtn.layer.borderWidth = 0.3
        initialViews = [viewTag2,viewTag3,viewTag4,viewTag6,viewTag8]
    }
    
    override func viewDidAppear(_ animated: Bool) {
       dissapearView()
    }
    
    @IBAction func tap16Gen(_ sender: UITapGestureRecognizer) {

        if(untouchedFlag){
            perform(#selector(changeActivity), with: nil, afterDelay: 20)
            untouchedFlag = false
        }
        if(sender.view?.tag == viewSequence[0].tag){
            UIView.transition(with: self.view, duration: 0.1, options: .transitionCrossDissolve, animations: {
                self.viewSequence[0].isHidden = true
            })
            self.viewSequence.remove(at: 0)
            correctCount += 1
        }
        else{
            incorrectCount += 1
        }
        
        if(self.viewSequence.count == 0){
            changeActivity()
        }
    }
    
    @IBAction func continueBtnTaped(_ sender: UIButton) {
       let vc = self.storyboard?.instantiateViewController(withIdentifier: "InteractionActivity3VC") as? InteractionActivity3VC ?? InteractionActivity3VC()
              self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func dissapearView(){
        if(self.initialViews.count > 0){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                self.randomNumber = Int.random(in: 0...(self.initialViews.count-1))
                self.viewSequence.append(self.initialViews[self.randomNumber])
                UIView.transition(with: self.view, duration: 0.4, options: .transitionCrossDissolve, animations: {
                    self.initialViews[self.randomNumber].isHidden = true
                })
                self.initialViews.remove(at: self.randomNumber)
                self.dissapearView()
            }
        }
        else{
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){
                for view in self.viewSequence{
                    view.isHidden = false
                    self.disableTouchView.isHidden = true
                }
            }
        }
    }
    
    @objc func changeActivity(){
        if(activityChange == false){
            activityChange = true
          let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC ?? ResultVC()
            if(correctCount-incorrectCount == 5){
                vc.caseNumber = self.caseNumber
            }
            else if(correctCount-incorrectCount >= 3){
                vc.caseNumber = 2
            }
            else{
                vc.caseNumber = 3
            }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //
    //
}
