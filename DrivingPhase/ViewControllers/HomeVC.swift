//
//  HomeVC.swift
//  DrivingPhase
//
//  Created by Junaid Zaidi on 27/12/2019.
//  Copyright © 2019 Junaid Zaidi. All rights reserved.
//

import UIKit
import FontAwesome_swift

class HomeVC: UIViewController {
    
    @IBOutlet weak var lastNightHourLbl: UILabel!
    @IBOutlet weak var nightBeforeLbl: UILabel!
    
    @IBOutlet weak var notTiredBtn : UIButton!
    @IBOutlet weak var exhausedBtn : UIButton!
    @IBOutlet weak var aBitTiredBtn : UIButton!
    @IBOutlet weak var veryTiredBtn : UIButton!
    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var noBtn: UIButton!
    @IBOutlet weak var yesBtn: UIButton!
    @IBOutlet weak var errorLbl: UILabel!
    
    var lastNight : Double? = nil
    var nightBefore : Double? = nil
    var alcoholStatus : Bool? = nil
    var currentFeeling : Int? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueBtn.layer.cornerRadius = 30
        continueBtn.clipsToBounds = true
        continueBtn.layer.borderColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.34).cgColor
        continueBtn.layer.borderWidth = 3
        AddImageToButton(btn: continueBtn, iconName: "fa-arrow-right", style: .solid, size: 20, color: UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.5))
        
        yesBtn.layer.cornerRadius = 7
        yesBtn.clipsToBounds = true
        yesBtn.layer.borderColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.45).cgColor
        yesBtn.layer.borderWidth = 3
        
        noBtn.layer.cornerRadius = 7
         noBtn.clipsToBounds = true
         noBtn.layer.borderColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.45).cgColor
         noBtn.layer.borderWidth = 3
        
        notTiredBtn.backgroundColor = UIColor.clear
        aBitTiredBtn.backgroundColor = UIColor.clear
        exhausedBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.3)
        exhausedBtn.alpha = 0.6
        veryTiredBtn.backgroundColor = UIColor.clear
        currentFeeling = 3
    }
    
    @IBAction func lastNightSliderValChanged(_ sender: UISlider) {
        errorLbl.isHidden = true
        lastNight = Double(sender.value)
        lastNightHourLbl.text =
            String(format: "%.1f", lastNight ?? 0) + " Hours"
    }
    
    @IBAction func nightBeforeSliderValChanged(_ sender: UISlider) {
        errorLbl.isHidden = true
        nightBefore = Double(sender.value)
        nightBeforeLbl.text =
            String(format: "%.1f", nightBefore ?? 0) + " Hours"
    }
    
    @IBAction func yesBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
//        yesBtn.alpha = 1
//        yesBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
//        noBtn.alpha = 0.7
//        noBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        alcoholStatus = true
        
        yesBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.3)
        yesBtn.setTitleColor(UIColor.label, for: .normal)
        noBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        noBtn.setTitleColor(UIColor.placeholderText, for: .normal)
    }
    
    @IBAction func noBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
//        noBtn.alpha = 1
//        yesBtn.alpha = 0.7
//        noBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 21)
//        yesBtn.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        alcoholStatus = false
        
        
        noBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.3)
        noBtn.setTitleColor(UIColor.label, for: .normal)
        yesBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        yesBtn.setTitleColor(UIColor.placeholderText, for: .normal)
    }
    
    @IBAction func notTiredBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        exhausedBtn.backgroundColor = UIColor.clear
        aBitTiredBtn.backgroundColor = UIColor.clear
        notTiredBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.3)
        notTiredBtn.alpha = 0.6
        veryTiredBtn.backgroundColor = UIColor.clear
        currentFeeling = 0
        
    }
    @IBAction func exhausedBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        notTiredBtn.backgroundColor = UIColor.clear
        aBitTiredBtn.backgroundColor = UIColor.clear
        exhausedBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.3)
        exhausedBtn.alpha = 0.6
        veryTiredBtn.backgroundColor = UIColor.clear
        currentFeeling = 3
    }
    @IBAction func aBitTiredBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        notTiredBtn.backgroundColor = UIColor.clear
        exhausedBtn.backgroundColor = UIColor.clear
        aBitTiredBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.3)
        aBitTiredBtn.alpha = 0.6
        veryTiredBtn.backgroundColor = UIColor.clear
        currentFeeling = 1
    }
    @IBAction func veryTiredBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        notTiredBtn.backgroundColor = UIColor.clear
        exhausedBtn.backgroundColor = UIColor.clear
        veryTiredBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.3)
        veryTiredBtn.alpha = 0.6
        aBitTiredBtn.backgroundColor = UIColor.clear
        currentFeeling = 2
    }
    
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        if (alcoholStatus == nil || currentFeeling == nil || lastNight == nil || nightBefore == nil) {
            errorLbl.isHidden = false
        }
        else if(currentFeeling == 3 || alcoholStatus! || (lastNight!+nightBefore!) < 8){
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResultVC") as? ResultVC ?? ResultVC()
            vc.caseNumber = 3
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "InteractionActivityVC") as? InteractionActivityVC ?? InteractionActivityVC()
            vc.caseNumber = (currentFeeling == 2 || (lastNight!+nightBefore!) < 12) ? 2 : 1
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func AddImageToButton(btn : UIButton?, iconName : String, style: FontAwesomeStyle, size: CGFloat, color : UIColor){
        btn?.titleLabel?.font = UIFont.fontAwesome(ofSize: size, style: style)
        btn?.titleLabel?.adjustsFontSizeToFitWidth = true
        btn?.setTitleColor(color, for: .normal)
        btn?.setTitle(String.fontAwesomeIcon(code: iconName) , for: .normal)
    }
}
