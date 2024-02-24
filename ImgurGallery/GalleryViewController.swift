//
//  ViewController.swift
//  ImgurGallery
//
//  Created by Linconl Rufino on 23/02/24.
//

import UIKit

class GalleryViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.register(ImageViewCell.self, forCellWithReuseIdentifier: "imageViewCell")
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageViewCell", for: indexPath)
        
        guard let imgurViewCell = (cell as? ImageViewCell) else { return cell }
        
        imgurViewCell.configure(url: nil)
        
        return imgurViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 85, height: 85)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
           return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
}
