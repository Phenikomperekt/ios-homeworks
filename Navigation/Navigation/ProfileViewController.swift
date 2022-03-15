//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Evgeny Mastepan on 02.03.2022.
//

import UIKit

class ProfileViewController: UIViewController {



    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView()



        return profileHeaderView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileHeaderView)
        profileHeaderView.addSubViews()

    }


    override func viewWillLayoutSubviews() {
        profileHeaderView.frame.size = self.view.frame.size
    }


}
