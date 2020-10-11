//
//  SplashVC.swift
//  DrivingPhase
//
//  Created by Junaid Zaidi on 15/02/2020.
//  Copyright © 2020 Junaid Zaidi. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.perform(#selector(self.moveToVC), with: nil, afterDelay: 0.6)
    }
    
    @objc func moveToVC() {
        if let user = DataHandler.getUser(){
            DataHandler.sharedInstance.loggedInUser = user
            let vc = self.storyboard?.instantiateViewController(identifier: "HomeVC") as? HomeVC ?? HomeVC()
            self.navigationController?.pushViewController(vc, animated: true)
            return
        }
        let vc = self.storyboard?.instantiateViewController(identifier: "SignInVC") as? SignInVC ?? SignInVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
