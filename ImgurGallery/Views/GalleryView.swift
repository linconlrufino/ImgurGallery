//
//  GalleryView.swift
//  ImgurGallery
//
//  Created by Linconl Rufino on 24/02/24.
//

import SwiftUI
import UIKit

class GalleryView: UIView {

    // MARK: - Layout Properties

    private lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = .white
        title.textColor = .black
        title.font = UIFont.boldSystemFont(ofSize: 32.0)
        title.text = "Gallery Cats"
        return title
    }()
    
    private lazy var moreImagesButton: UIButton = {
        let button = UIButton()
        button.setTitle("More Cats", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemYellow
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(getMoreImagesButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    // MARK: - Initializer
    
    private var galleryViewModel = GalleryViewModel(galleryService: GalleryService())

    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        
        galleryViewModel.images.bind{ [weak self] value in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
        
        galleryViewModel.getImages(page: 1)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Codable
    
    private func setupView () {
        addSubview(title)
        addSubview(moreImagesButton)
        addSubview(collectionView)
        buildViewConstraints()
        self.backgroundColor = .white
        collectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: ImageViewCell.identifier)
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            title.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),

            collectionView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            
            moreImagesButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 16),
            moreImagesButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            moreImagesButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            moreImagesButton.widthAnchor.constraint(equalToConstant: 180)
        ])
    }
    
    @objc func getMoreImagesButton(_ sender: UIButton) {
        galleryViewModel.getMoreImages()
    }
}

// MARK: - DataSource

extension GalleryView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection sectionIndex: Int) -> Int {
        galleryViewModel.images.value?.count ?? 0
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath)
        
        guard let imgurViewCell = (cell as? ImageViewCell) else { return cell }
        
        imgurViewCell.configure(url: galleryViewModel.images.value?[indexPath.row].url)
        
        return imgurViewCell
    }
}

// MARK: - Delegate

extension GalleryView: UICollectionViewDelegate {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension GalleryView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}
