//
//  ViewController.swift
//  ImgurGallery
//
//  Created by Linconl Rufino on 23/02/24.
//

import UIKit

class GalleryViewController: UIViewController {

    // MARK: - Layout Properties

    private lazy var galleryView: GalleryView = {
        let galleryView = GalleryView()
        galleryView.translatesAutoresizingMaskIntoConstraints = false
        return galleryView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addView()
        buildViewConstraints()
    }

    // MARK: - View Codable
    
    private func addView() {
        view.addSubview(galleryView)
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            galleryView.topAnchor.constraint(equalTo: view.topAnchor),
            galleryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            galleryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            galleryView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
