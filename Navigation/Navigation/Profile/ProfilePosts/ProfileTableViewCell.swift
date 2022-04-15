//
//  ProfileTableViewCell.swift
//  Navigation
//
//  Created by Evgeny Mastepan on 10.04.2022.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {

    private var statusText: String = ""
    private var statusTag: Bool = false
    var actionBlock: (() -> Void)? = nil

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    func addSubViews() {
        self.backgroundColor = .lightGray

        self.addSubview(avatar)
        let avatarTopAncor = avatar.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 16)
        let avatarLeadingAnchor = avatar.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let avatarWidthAnchor = avatar.widthAnchor.constraint(equalToConstant: 150)
        let avatarHeightAnchor = avatar.heightAnchor.constraint(equalToConstant: 150)

        self.addSubview(showButton)
        let showButtonTopAncor = showButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16)
        let showButtonLeadingAnchor = showButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0)
        let showButtonTrailingAnchor = showButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        let showButtonHeightAnchor = showButton.bottomAnchor.constraint(equalTo: self.layoutMarginsGuide.bottomAnchor)
        self.addSubview(nameLabel)
        let nameLabelWidthAnchor = nameLabel.widthAnchor.constraint(equalToConstant: 200)
        let nameLabelLeftAnchor = nameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 16)
        let nameLabelTopAnchor = nameLabel.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 27)

        self.addSubview(statusLabel)
        let statusLabelWidthAnchor = statusLabel.widthAnchor.constraint(equalToConstant: 200)
        let statusLabelLeftAnchor = statusLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 16)
        let statusLabelBottomAnchor = statusLabel.bottomAnchor.constraint(equalTo: showButton.topAnchor, constant: -34)

        NSLayoutConstraint.activate([avatarTopAncor, avatarLeadingAnchor, avatarWidthAnchor, avatarHeightAnchor,
                                    showButtonTopAncor, showButtonLeadingAnchor, showButtonTrailingAnchor, showButtonHeightAnchor,
                                    nameLabelWidthAnchor, nameLabelLeftAnchor, nameLabelTopAnchor,
                                     statusLabelWidthAnchor, statusLabelLeftAnchor, statusLabelBottomAnchor])
    }

    lazy var showButton: UIButton = {
        let showButton = UIButton()
        showButton.setTitle("New status", for: .normal)
        showButton.setTitleColor(.white, for: .normal)
        showButton.setTitleColor(.systemGray, for: .selected)
        showButton.setTitleShadowColor(.systemMint, for: .normal)
        showButton.addTarget(self, action: #selector(TapShowButton), for: .touchUpInside)
        showButton.backgroundColor = .systemBlue
        showButton.layer.cornerRadius = 4.0
        showButton.translatesAutoresizingMaskIntoConstraints = false
        showButton.layer.shadowRadius = 4.0
        showButton.layer.shadowOpacity = 0.7
        showButton.setTitleShadowColor(.black, for: .normal)
        showButton.layer.shadowOffset = CGSize(width: 4, height: 4)

        return showButton
    }()


    private lazy var avatar: UIImageView = {
        let imageView = UIImageView (image: UIImage(named: "cat_photo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.frame.size = CGSize(width: 50, height: 50)
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 75.0
        imageView.clipsToBounds = true

        return imageView
    }()


    private lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18) // 24 лучше
        nameLabel.text = "Gentle cat"
        nameLabel.textColor = .black

        return nameLabel
    }()

    private lazy var statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.textAlignment = .left
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.font = UIFont.systemFont(ofSize: 14) // 17 лучше
        statusLabel.text = "Waiting for miracle..."
        statusLabel.textColor = .darkGray

        return statusLabel
    }()

    private lazy var statusTextField: UITextField = {
        let statusTextField = UITextField()
        statusTextField.font = UIFont.systemFont(ofSize: 15)
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.textColor = .black
        statusTextField.backgroundColor = .white
        statusTextField.layer.cornerRadius = 12.0
        statusTextField.layer.borderColor = UIColor.black.cgColor
        statusTextField.layer.borderWidth = 1.0

        return statusTextField
    }()

    private func theStatusTextField() {
        self.addSubview(statusTextField)
        self.statusTextField.bottomAnchor.constraint(equalTo: statusLabel.bottomAnchor).isActive = true
        self.statusTextField.leftAnchor.constraint(equalTo: statusLabel.leftAnchor).isActive = true
        self.statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        self.statusTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.statusTextField.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0) // Искажение для отступа поля ввода
        self.statusTextField.becomeFirstResponder() // Фокус на поле ввода.
    }


    private func statusTextChanged (statusTemp: String?){
        if let statusTextTemp = statusTemp {
        statusText = statusTextTemp
        self.statusLabel.text = statusText
        }
    }

    @objc func TapShowButton(sender: UIButton) {
        actionBlock?()
    }

    func mustShowButton () {
        if !statusTag {
            theStatusTextField()
            showButton.setTitle("Save status", for: .normal)

            statusTag.toggle()

        } else if statusTag {
            statusTextChanged(statusTemp: statusTextField.text)
            self.statusTextField.removeFromSuperview()
            showButton.setTitle("New status", for: .normal)
            statusTag.toggle()
        }
    }

}
