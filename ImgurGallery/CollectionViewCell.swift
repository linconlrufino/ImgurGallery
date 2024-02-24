//
//  CollectionViewCell.swift
//  ImgurGallery
//
//  Created by Linconl Rufino on 24/02/24.
//

import UIKit

class ImageViewCell: UICollectionViewCell {
    
    static let identifier = "imageViewCell"
    
    // MARK: - Layout Properties
  
    private lazy var image: UIImageView = {
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        image.image = UIImage(systemName: "cat")
        image.backgroundColor = .darkGray
        return image
    }()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - View Codable

    private func layout() {
        addSubview(image)
        buildViewConstraints()
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 85),
            image.widthAnchor.constraint(equalToConstant: 85),
            image.centerXAnchor.constraint(equalTo: centerXAnchor),
            image.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func configure(url: URL?) {
        //todo: set image with kingfisher
    }
}
