//
//  InfoViewController.swift
//  Navigation
//
//  Created by Evgeny Mastepan on 07.03.2022.
//

import UIKit

class InfoViewController: UIViewController {

    private lazy var infoButton: UIButton = {
        let infoButton = UIButton()
        infoButton.setTitle("to Post", for: .normal)
        infoButton.setTitleColor(.white, for: .normal)
        infoButton.setTitleColor(.systemGray, for: .selected)
        infoButton.setTitleShadowColor(.systemMint, for: .normal)
        infoButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        infoButton.backgroundColor = .systemBlue
        infoButton.layer.cornerRadius = 12.0
        infoButton.translatesAutoresizingMaskIntoConstraints = false
        return infoButton
    }()



    override func viewDidLoad() {
        super.viewDidLoad()

        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        self.navigationItem.title = "Info"

    }
    


}
