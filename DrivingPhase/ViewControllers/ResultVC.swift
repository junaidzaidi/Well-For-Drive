//
//  ResultVC.swift
//  DrivingPhase
//
//  Created by Junaid Zaidi on 23/01/2020.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import UIKit
import FontAwesome_swift
import FirebaseFirestore
import FirebaseDatabase

class ResultVC: UIViewController {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var statusLbl: UILabel!
    
    var caseNumber : Int? = 3
    var ref: DatabaseReference? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(moveToHomeVC), with: nil, afterDelay: 30)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch caseNumber {
        case 1:
//            backgroundView.backgroundColor = UIColor(red:1.00, green:0.41, blue:0.38, alpha:0.2)
            statusLbl.textColor = UIColor(red: 28/255, green: 164/255, blue: 93/255, alpha: 0.45)
            statusLbl.text = "Have a safe journey"
            
        case 2:
//            backgroundView.backgroundColor = UIColor(red:1.00, green:0.41, blue:0.38, alpha:0.2)
            statusLbl.textColor = UIColor(red:1.00, green:1.00, blue:0, alpha:1.0)
            statusLbl.text = "Be cautious"

        case 3:
            statusLbl.textColor = UIColor(red:1.00, green:0.3, blue:0.3, alpha:1)
//            statusLbl.textColor = UIColor(red:1.00, green:0.41, blue:0.38, alpha:1.0)
            statusLbl.text = "You need rest"
        case .none:
            backgroundView.backgroundColor = UIColor(red:1.00, green:0.41, blue:0.38, alpha:0.4)
            statusLbl.textColor = UIColor(red:1.00, green:0.41, blue:0.38, alpha:1.0)
            statusLbl.text = "You need rest"
        case .some(_):
//            backgroundView.backgroundColor = UIColor(red:1.00, green:0, blue:0, alpha:0.2)
            statusLbl.textColor = UIColor(red:1.00, green:0.41, blue:0.38, alpha:1.0)
            statusLbl.text = "You need rest"
        }
//        let db = Firestore.firestore()
//        print(db)
//        ref = Database.database().reference()
        ref = Database.database().reference()
        self.ref?.child("result").childByAutoId().setValue(["id": "\(String(describing: DataHandler.sharedInstance.loggedInUser?.username ?? ""))/\(String(describing: DataHandler.sharedInstance.loggedInUser?.age ?? ""))/\(String(describing: DataHandler.sharedInstance.loggedInUser?.gender ?? ""))/\(String(describing: DataHandler.sharedInstance.loggedInUser?.company ?? ""))/\(String(describing: DataHandler.sharedInstance.loggedInUser?.vehicleType ?? ""))",
            "result": statusLbl.text ?? "",
            "time": Date().description
        ]){ err,ref   in
            guard err == nil else{
//                    debugPrint(err)
                let alert = UIAlertController(title: "Unable To Connect", message: "Please Check Your Internet Connection And Give Test Again", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
    }
    
    @objc func moveToHomeVC() {
        let vc = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC ?? HomeVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func AddImageToButton(btn : UIButton?, iconName : String, style: FontAwesomeStyle, size: CGFloat, color : UIColor){
        btn?.titleLabel?.font = UIFont.fontAwesome(ofSize: size, style: style)
        btn?.titleLabel?.adjustsFontSizeToFitWidth = true
        btn?.setTitleColor(color, for: .normal)
        btn?.setTitle(String.fontAwesomeIcon(code: iconName) , for: .normal)
    }
}
