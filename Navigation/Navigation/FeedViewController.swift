//
//  FeedViewController.swift
//  Navigation
//
//  Created by Evgeny Mastepan on 02.03.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private lazy var postButton: UIButton = {
        let postButton = UIButton()
        postButton.setTitle("to Post", for: .normal)
        postButton.setTitleColor(.white, for: .normal)
        postButton.setTitleColor(.systemGray, for: .selected)
        postButton.setTitleShadowColor(.systemMint, for: .normal)
        postButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        postButton.backgroundColor = .systemBlue
        postButton.layer.cornerRadius = 12.0
        postButton.translatesAutoresizingMaskIntoConstraints = false
        return postButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray5
        self.navigationItem.title = "Post list"

        self.view.addSubview(self.postButton)
        self.postButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
        self.postButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        self.postButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
        self.postButton.heightAnchor.constraint(equalToConstant: 30).isActive = true

    }

    @objc private func didTapButton () {
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }


}
