//
//  ProfileViewController.swift
//  Netology_IB_Instruments
//
//  Created by Evgeny Mastepan on 21.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if let subview = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? ProfileView {
            self.view.addSubview(subview)
            subview.frame = CGRect(x: 0, y: 0, width: 200, height: 200)

        }


    }
    



}
