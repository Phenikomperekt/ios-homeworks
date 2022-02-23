//
//  ProfileView.swift
//  Netology_IB_Instruments
//
//  Created by Evgeny Mastepan on 21.02.2022.
//

import UIKit

class ProfileView: UIView {

    @IBOutlet weak var UserResumeUIImageView: UIImageView!

    @IBOutlet weak var userResumeUILabel: UILabel!

    @IBOutlet weak var userResumeBirthdayUILabel: UILabel!

    @IBOutlet weak var userResumeLivePlaceUILabel: UILabel!

    @IBOutlet weak var userResumeSummaryUITextView: UITextView!

    override init(frame: CGRect) {
            super.init(frame: frame)
            self.setupView()
        }

        required init?(coder: NSCoder) {
           super.init(coder: coder)
            self.setupView()
        }

        private func setupView() {
            let view = self.loadViewFromXib()
            view.frame = self.bounds
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.addSubview(view)
        }

        private func loadViewFromXib() -> UIView {
            guard let view = Bundle.main.loadNibNamed("ProfileView", owner: nil, options: nil)?.first as? UIView else { return UIView() }

            return view
        }
   

}
