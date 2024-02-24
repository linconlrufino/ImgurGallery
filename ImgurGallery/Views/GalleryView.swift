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
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.backgroundColor = .white
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    // MARK: - Initializer
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Codable
    
    private func setupView () {
        addSubview(collectionView)
        buildViewConstraints()
        collectionView.register(ImageViewCell.self, forCellWithReuseIdentifier: ImageViewCell.identifier)
//        collectionView.register(
//            SeeMoreHeaderView.self,
//            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
//            withReuseIdentifier: SeeMoreHeaderView.identifier
//        )
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}

// MARK: - DataSource

extension GalleryView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection sectionIndex: Int) -> Int {
        return 75
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath)
        
        guard let imgurViewCell = (cell as? ImageViewCell) else { return cell }
        
        imgurViewCell.configure(url: nil)
        
        return imgurViewCell
    }
    
//    public func collectionView(
//        _ collectionView: UICollectionView,
//        viewForSupplementaryElementOfKind kind: String,
//        at indexPath: IndexPath
//    ) -> UICollectionReusableView {
//        
//        let headerView = collectionView.dequeueReusableSupplementaryView(
//            ofKind: kind,
//            withReuseIdentifier: SeeMoreHeaderView.identifier,
//            for: indexPath
//        )
//        
//        guard let typedHeaderView = headerView as? SeeMoreHeaderView
//        else { return headerView }
//        
//        switch sections[indexPath.section] {
//        case .nowShowing:
//            typedHeaderView.configure(title: "Now Showing")
//        case .popular:
//            typedHeaderView.configure(title: "Popular")
//        }
//        
//        return typedHeaderView
//    }
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

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(
                rootViewController: GalleryViewController()
            )
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    }
}
