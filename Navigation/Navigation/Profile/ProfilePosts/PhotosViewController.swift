//
//  PhotosViewController.swift
//  HUI6
//
//  Created by Evgeny Mastepan on 07.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {
    var post = Post(title: "Text1", text: "Text2")
    var images = [UIImage]()
    let photosInRow: CGFloat = 3


    private func addImage() {
        for i in 1...45 {
            let image = UIImage(named: "\(i)")!
            images.append(image)
        }
    }

    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8.0
        layout.minimumLineSpacing = 8.0
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: "PhotoCell")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.addImage()
        self.view.backgroundColor = .white
        self.navigationItem.title = post.title
        self.view.addSubview(self.collectionView)

        let topConstraint = self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leftConstraint = self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8)
        let rightConstraint = self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8)
        let bottomConstraint = self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)

        NSLayoutConstraint.activate([
            topConstraint, leftConstraint, rightConstraint, bottomConstraint
        ])

    }

    private func itemSize(for width: CGFloat, with spacing: CGFloat) -> CGSize {
        let neededWidth = width - 2 * spacing
        let itemWidth = floor(neededWidth / photosInRow)

        return CGSize(width: itemWidth, height: itemWidth)
    }


}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as? PhotosCollectionViewCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            cell.backgroundColor = .systemRed
            return cell
        }

        let image = images[indexPath.item]

        cell.setup(with: image)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let spacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing

        return self.itemSize(for: collectionView.frame.width, with: spacing ?? 0)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let currentImage: UIImage = UIImage(named: "\(indexPath.item + 1)")!
        let vc = ZoomViewController()
        navigationController?.present(vc, animated: true, completion: nil)
        vc.setup(with: currentImage)
    }


}
