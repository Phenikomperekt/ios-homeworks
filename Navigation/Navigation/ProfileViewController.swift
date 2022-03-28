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

        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        let topProfileView = profileHeaderView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor)
        let leftProfileView = profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightProfileView = profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let heightProfileView = profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        NSLayoutConstraint.activate([topProfileView, leftProfileView,
                                     rightProfileView, heightProfileView])

        profileHeaderView.addSubViews()



    }

}
