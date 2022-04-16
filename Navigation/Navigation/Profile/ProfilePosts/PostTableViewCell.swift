//
//  StaticArticleTableViewCell.swift
//  UITableHui
//
//  Created by Evgeny Mastepan on 01.04.2022.
//

import UIKit

final class PostTableViewCell: UITableViewCell {

    struct ViewModel: ViewModelProtocol {
        let author: String
        let description: String
        let image: String
        let likes: Int
        let views: Int
    }

    private lazy var backView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var authorLabel: UILabel = {
        let authorLabel = UILabel()
        let font: UIFont = UIFont.boldSystemFont(ofSize: 20)
        authorLabel.backgroundColor = .clear
        authorLabel.numberOfLines = 2
        authorLabel.font = font
        authorLabel.textColor = .black
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        return authorLabel
    }()

    private lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        let coordinates = UIScreen.main.bounds.width
        postImageView.translatesAutoresizingMaskIntoConstraints = false
        postImageView.backgroundColor = .black
        postImageView.contentMode = .scaleAspectFit

        return postImageView
    }()

    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        let font: UIFont = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = font
        descriptionLabel.textColor = .systemGray
        descriptionLabel.textAlignment = .justified
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        return descriptionLabel
    }()

    private lazy var likesLabel: UILabel = {
        let likesLabel = UILabel()
        let font: UIFont = UIFont.systemFont(ofSize: 16)
        likesLabel.font = font
        likesLabel.textColor = .black
        likesLabel.translatesAutoresizingMaskIntoConstraints = false
        return likesLabel
    }()

    private lazy var viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        let font: UIFont = UIFont.systemFont(ofSize: 16)
        viewsLabel.font = font
        viewsLabel.textColor = .black
        viewsLabel.textAlignment = .right
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        return viewsLabel
    }()

    private lazy var bottomStackView: UIStackView = {
        let bottomStackView = UIStackView()
        bottomStackView.backgroundColor = .systemGray6
        bottomStackView.axis = .horizontal
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        return bottomStackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.authorLabel.text = nil
        self.postImageView.image = nil
        self.descriptionLabel.text = nil
        self.likesLabel.text = nil
        self.viewsLabel.text = nil
    }

    private func setupView() {

        self.contentView.addSubview(self.backView)
        self.backView.addSubview(self.stackView)
        self.stackView.addArrangedSubview(authorLabel)
        self.stackView.addArrangedSubview(postImageView)
        self.stackView.addArrangedSubview(descriptionLabel)
        self.stackView.addArrangedSubview(bottomStackView)
        self.bottomStackView.addArrangedSubview(likesLabel)
        self.bottomStackView.addArrangedSubview(viewsLabel)

        let backViewConstraints = self.backViewConstraints()
        let stackViewConstraints = self.stackViewConstrints()
        let authorLabelConstraints = self.authorLabelConstraints()
        let imageViewConstraints = self.imageViewConstraints()
        let descriptionLabelConstraints = self.descriptionLabelConstraints()
        let bottomStackViewConstrints = self.bottomStackViewConstrints()
//        let likesLabelConstraints = self.likesLabelConstraints()
//        let viewsLabelConstraints = self.viewsLabelConstraints()

        NSLayoutConstraint.activate(
                                      backViewConstraints
                                    + stackViewConstraints
                                    + authorLabelConstraints
                                    + imageViewConstraints
                                    + descriptionLabelConstraints
                                    + bottomStackViewConstrints
//                                    + likesLabelConstraints
//                                    + viewsLabelConstraints
        )

    }

    private func backViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.backView.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        let leadingConstraint = self.backView.leftAnchor.constraint(equalTo: self.contentView.leftAnchor)
        let trailingConstraint = self.backView.rightAnchor.constraint(equalTo: self.contentView.rightAnchor)
        let bottomConstraints = self.backView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)

        return [topConstraint, leadingConstraint, trailingConstraint, bottomConstraints]
    }

    private func stackViewConstrints() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.backView.topAnchor)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor)
        let trailingConstraint = self.stackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor)
        let bottomConstraints = self.stackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)

        return [topConstraint, leadingConstraint, trailingConstraint, bottomConstraints]
    }

    private func authorLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.authorLabel.topAnchor.constraint(equalTo: self.stackView.topAnchor, constant: 16)
        let leadingConstraint = self.authorLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 16)
        let trailingConstraint = self.authorLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -16)
        return [topConstraint, leadingConstraint, trailingConstraint]
    }

    private func imageViewConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.postImageView.topAnchor.constraint(equalTo: self.authorLabel.bottomAnchor, constant: 12)
        let leadingConstraint = self.postImageView.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor)
        let widthImageContraint = self.postImageView.widthAnchor.constraint(equalTo: self.stackView.widthAnchor)
        let heightImageConstraint = self.postImageView.heightAnchor.constraint(equalTo: self.stackView.widthAnchor)

        return [
            topConstraint, leadingConstraint, widthImageContraint, heightImageConstraint
        ]
    }

    private func descriptionLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16)
        let leadingConstraint = self.descriptionLabel.leadingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: 16)
        let trailingConstraint = self.descriptionLabel.trailingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: -16)

        return [
            topConstraint, leadingConstraint, trailingConstraint
        ]
    }

    private func bottomStackViewConstrints() -> [NSLayoutConstraint] {
        let topConstraint = self.bottomStackView.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16)
        let leadingConstraint = self.bottomStackView.leadingAnchor.constraint(equalTo: self.backView.leadingAnchor, constant: 16)
        let trailingConstraint = self.bottomStackView.trailingAnchor.constraint(equalTo: self.backView.trailingAnchor, constant: -16)
        let bottomConstraints = self.bottomStackView.bottomAnchor.constraint(equalTo: self.backView.bottomAnchor)
        return [topConstraint, leadingConstraint, trailingConstraint, bottomConstraints]
    }

    private func likesLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.likesLabel.topAnchor.constraint(equalTo: self.bottomStackView.bottomAnchor)
        let leadingConstraint = self.likesLabel.leftAnchor.constraint(equalTo: self.bottomStackView.leftAnchor)
        let trailingConstraint = self.likesLabel.rightAnchor.constraint(equalTo: self.bottomStackView.centerXAnchor)
        return [topConstraint, leadingConstraint, trailingConstraint]
    }

    private func viewsLabelConstraints() -> [NSLayoutConstraint] {
        let topConstraint = self.viewsLabel.topAnchor.constraint(equalTo: self.bottomStackView.bottomAnchor)
        let leadingConstrint = self.viewsLabel.leadingAnchor.constraint(equalTo: self.bottomStackView.centerXAnchor)
        let trailingConstraint = self.viewsLabel.rightAnchor.constraint(equalTo: self.bottomStackView.rightAnchor)
        return [topConstraint, leadingConstrint, trailingConstraint]
    }


}

//MARK: -Assigment

    extension PostTableViewCell: Setupable {
        func setup(with viewModel: ViewModelProtocol) {
            guard let viewModel = viewModel as? ViewModel
            else { return }

            self.authorLabel.text = viewModel.author
            self.postImageView.image = UIImage(named: viewModel.image)
            self.descriptionLabel.text = viewModel.description
            self.likesLabel.text = "Likes: " + String(viewModel.likes)
            self.viewsLabel.text = "Views: " + String(viewModel.views)
        }
    }


