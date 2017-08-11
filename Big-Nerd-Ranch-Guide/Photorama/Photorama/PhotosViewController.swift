//
//  PhotoViewController.swift
//  Photorama
//
//  Created by Radio Shaolin on 11.08.17.
//  Copyright © 2017 Radio Shaolin. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    var store: PhotoStore!
    let photoDataSource = PhotoDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photoDataSource
        
        store.fetchInterestingPhotos { (photosResult) -> Void in
            
            switch photosResult {
            case let .success(photos):
                print("Successfully found \(photos.count) photos.")
                self.photoDataSource.photos = photos
            case let .failure(error):
                print("Error fetching interesting photos: \(error)")
                self.photoDataSource.photos.removeAll()
            }
        self.collectionView.reloadSections(IndexSet(integer: 0))
        }
    }
    
    
    
    
    
}
