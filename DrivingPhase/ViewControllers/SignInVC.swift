//
//  SignInVC.swift
//  DrivingPhase
//
//  Created by Junaid Zaidi on 30/01/2020.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import UIKit
import FontAwesome_swift
import FirebaseFirestore
import FirebaseDatabase

class SignInVC: UIViewController {

    @IBOutlet weak var continueBtn: UIButton!
    @IBOutlet weak var fullNameImgLbl: UILabel!
    @IBOutlet weak var ageImgLbl: UILabel!
    @IBOutlet weak var ageLbl2: UILabel!
    @IBOutlet weak var genderImgLbl: UILabel!
    @IBOutlet weak var companyImgLbl: UILabel!
    @IBOutlet weak var driveImgLbl: UILabel!
    @IBOutlet weak var errorLbl: UILabel!
    
    @IBOutlet weak var maleBtn: UIButton!
    @IBOutlet weak var femaleBtn: UIButton!
    @IBOutlet weak var busBtn: UIButton!
    @IBOutlet weak var carBtn: UIButton!
    @IBOutlet weak var helicopterBtn: UIButton!
    @IBOutlet weak var truckBtn: UIButton!
    
    @IBOutlet weak var fullNameTxtFld: UITextField!
    @IBOutlet weak var ageTxtFld: UITextField!
    @IBOutlet weak var companyTxtFld: UITextField!

    var fullName : String?
    var age :  Int?
    var gender : Bool?
    var company : String?
    var vehicle : Int?
    var ref: DatabaseReference? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameTxtFld.delegate = self
        ageTxtFld.delegate = self
        companyTxtFld.delegate = self
       
        self.hideKeyboardWhenTappedAround()
        AddSolidImageToLabel(label: fullNameImgLbl, iconName: "fa-user-alt", style: .solid, size: 20, color: UIColor.white)
        AddSolidImageToLabel(label: ageImgLbl, iconName: "fa-baby", style: .solid, size:22, color: UIColor.white)
        AddSolidImageToLabel(label: ageLbl2, iconName: "fa-male", style: .solid, size: 30, color: UIColor.white)
        AddSolidImageToLabel(label: genderImgLbl, iconName: "fa-venus-mars", style: .solid, size: 25, color: UIColor.white)
        AddSolidImageToLabel(label: companyImgLbl, iconName: "fa-building", style: .solid, size: 25, color: UIColor.white)
        AddSolidImageToLabel(label: driveImgLbl, iconName: "fa-shuttle-van", style: .solid, size: 25, color: UIColor.white)
        AddImageToButton(btn: continueBtn, iconName: "fa-arrow-right", style: .solid, size: 20, color: UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.5))
        
        continueBtn.layer.cornerRadius = 30
        continueBtn.clipsToBounds = true
        continueBtn.layer.borderColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.34).cgColor
        continueBtn.layer.borderWidth = 3
    
    }
    
    @IBAction func femaleBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        femaleBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.1)
        femaleBtn.setTitleColor(UIColor.darkGray, for: .normal)
        maleBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        maleBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        gender = true
    }
    @IBAction func maleBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        maleBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.1)
        femaleBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        maleBtn.setTitleColor(UIColor.darkGray, for: .normal)
        femaleBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        gender = false
    }
    @IBAction func helicopterBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        helicopterBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.1)
        truckBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        busBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        carBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        helicopterBtn.setTitleColor(UIColor.darkGray, for: .normal)
        truckBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        busBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        carBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        vehicle = 1
    }
    @IBAction func truckBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        helicopterBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        truckBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.1)
        busBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        carBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        truckBtn.setTitleColor(UIColor.darkGray, for: .normal)
        helicopterBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        busBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        carBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        
        vehicle = 2
    }
    @IBAction func busBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        helicopterBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        truckBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        busBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.1)
        carBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        
        busBtn.setTitleColor(UIColor.darkGray, for: .normal)
        helicopterBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        truckBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        carBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        
        vehicle = 3
    }
    @IBAction func carBtnTapped(_ sender: UIButton) {
        errorLbl.isHidden = true
        helicopterBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        truckBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        busBtn.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        carBtn.backgroundColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.1)
        
        carBtn.setTitleColor(UIColor.darkGray, for: .normal)
        helicopterBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        truckBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        busBtn.setTitleColor(UIColor.placeholderText, for: .normal)
        vehicle = 4
    }
    @IBAction func continueBtnTapped(_ sender: UIButton) {
        
        if(vehicle == nil || gender == nil || fullNameTxtFld.text == "" || companyTxtFld.text == "" || ageTxtFld.text == ""){
            errorLbl.isHidden = false
        }
        else{
//            let db = Firestore.firestore()
//            print(db)
            ref = Database.database().reference()
            continueBtn.setTitle(nil, for: .normal)
            let spinner = UIActivityIndicatorView(style: .medium)
            spinner.color = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.8)
            spinner.center = continueBtn.center
            continueBtn.superview?.addSubview(spinner)
            DispatchQueue.main.async {
                spinner.startAnimating()
            }
            
            self.ref?.child("user").childByAutoId().setValue(["name": fullNameTxtFld.text ?? "",
            "age": ageTxtFld.text ?? "",
            "company": companyTxtFld.text ?? "",
            "gender": gender ?? false ? "F" : "M",
            "vehicle": getVehicleType(vehicle: vehicle ?? 0)]){ err,ref   in
                spinner.stopAnimating()
                guard err == nil else{
//                    debugPrint(err)
                    let alert = UIAlertController(title: "Unable To Connect", message: "Please Check Your Internet Connection", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                
                DataHandler.sharedInstance.loggedInUser = User(username: self.fullNameTxtFld.text ?? "", age: self.ageTxtFld.text ?? "", gender: self.gender ?? false ? "F" : "M", company: self.companyTxtFld.text ?? "", vehicleType: self.getVehicleType(vehicle: self.vehicle ?? 0))
               DataHandler.saveUser(user: DataHandler.sharedInstance.loggedInUser!)
               let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC ?? HomeVC()
               self.navigationController?.pushViewController(vc, animated: true)
            }
        }
 
    }
    func getVehicleType(vehicle : Int) -> String {
        switch (vehicle) {
        case 1:
            return "Helicopter"
        case 2:
            return "Truck"
        case 3:
            return "Bus"
        case 4:
            return "Car"
        default:
            return "None"
        }
    }
    func AddSolidImageToLabel(label : UILabel, iconName : String, style: FontAwesomeStyle, size: CGFloat, color: UIColor){
        label.font = UIFont.fontAwesome(ofSize: size, style: style)
        label.text = String.fontAwesomeIcon(code: iconName)
        label.textColor = color
    }
    
    func AddImageToButton(btn : UIButton?, iconName : String, style: FontAwesomeStyle, size: CGFloat, color : UIColor){
        btn?.titleLabel?.font = UIFont.fontAwesome(ofSize: size, style: style)
        btn?.titleLabel?.adjustsFontSizeToFitWidth = true
        btn?.setTitleColor(color, for: .normal)
        btn?.setTitle(String.fontAwesomeIcon(code: iconName) , for: .normal)
    }
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension SignInVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
    replacementString string: String) -> Bool {
        errorLbl.isHidden = true
        guard let text = textField.text else { return true }
        let newLength = text.count + string.count - range.length
        if(textField == ageTxtFld){
            return newLength <= 2
        }
        else{
            return newLength <= 20 // replace 30 for your max length value
        }
    }
}

