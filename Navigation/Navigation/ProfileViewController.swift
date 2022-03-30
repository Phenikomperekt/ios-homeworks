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
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return profileHeaderView
    }()

    private lazy var tableScrollView: UIScrollView = {
        let tableScrollView = UIScrollView()
        tableScrollView.backgroundColor = .white
        tableScrollView.translatesAutoresizingMaskIntoConstraints = false

        return tableScrollView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(profileHeaderView)
        let topProfileView = profileHeaderView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor)
        let leftProfileView = profileHeaderView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightProfileView = profileHeaderView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let heightProfileView = profileHeaderView.heightAnchor.constraint(equalToConstant: 220)

        self.view.addSubview(tableScrollView)
        let topTableScrollView = tableScrollView.topAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor)
        let leftTableScrollView = tableScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightTableScrollView = tableScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let bottomTableScrollView = tableScrollView.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor)



        NSLayoutConstraint.activate([
                                     topProfileView, leftProfileView, rightProfileView, heightProfileView,
                                     topTableScrollView, leftTableScrollView, rightTableScrollView, bottomTableScrollView
                                    ])

        profileHeaderView.addSubViews()



    }

}
