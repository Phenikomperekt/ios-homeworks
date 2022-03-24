//
//  LogInViewController.swift
//  Navigation
//
//  Created by Evgeny Mastepan on 23.03.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private lazy var logInScrollView: UIScrollView = {
        let logInScrollView = UIScrollView()
        logInScrollView.translatesAutoresizingMaskIntoConstraints = false
        return logInScrollView
    }()


    private lazy var logInView: LogInView = {
        let logInView = LogInView()
        logInView.translatesAutoresizingMaskIntoConstraints = false
        return logInView
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
        let noteCenter = NotificationCenter.default
        noteCenter.addObserver(self, selector: #selector(kbWillShow),
                               name: UIResponder.keyboardWillShowNotification, object: nil)
        noteCenter.addObserver(self, selector: #selector(kbWillHide),
                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(logInScrollView)
        self.logInScrollView.addSubview(logInView)

        self.view.addSubview(logInView)
        setupConstraints()
        logInView.addLogInElements()


    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        let noteCenter = NotificationCenter.default
        noteCenter.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        noteCenter.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func setupConstraints() {
        let topScrollView = logInScrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let bottomScrollView = logInScrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        let leftScrollView = logInScrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightScrollView = logInScrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)

        let topLogInView = logInView.topAnchor.constraint(equalTo: self.logInScrollView.layoutMarginsGuide.topAnchor)
        let bottomLogInView = logInView.bottomAnchor.constraint(equalTo: self.logInScrollView.layoutMarginsGuide.bottomAnchor)
        let leftLogInView = logInView.leftAnchor.constraint(equalTo: self.logInScrollView.layoutMarginsGuide.leftAnchor)
        let rightLogInView = logInView.rightAnchor.constraint(equalTo: self.logInScrollView.layoutMarginsGuide.rightAnchor)

        NSLayoutConstraint.activate([
                                     topScrollView, bottomScrollView, leftScrollView, rightScrollView,
                                     topLogInView, bottomLogInView, rightLogInView, leftLogInView
                                    ])
    }

    @objc private func kbWillShow(notification: NSNotification) {
        if let kbdSize =
            (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            logInScrollView.contentInset.bottom = kbdSize.height
            logInScrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: kbdSize.height, right: 0)
        }

    }

    @objc func kbWillHide() {
        logInScrollView.contentInset.bottom = .zero
        logInScrollView.verticalScrollIndicatorInsets = .zero
    }




}
