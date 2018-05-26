//
//  TestimonialViewController.swift
//  DesignCodeApp
//
//  Created by Weijie Lin on 5/25/18.
//  Copyright © 2018 Weijie Lin. All rights reserved.
//

import UIKit

class TestimonialViewController: UIViewController {

    @IBOutlet weak var testmonialCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        testmonialCollectionView.delegate = self
        testmonialCollectionView.dataSource = self
    }

}

extension TestimonialViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testimonials.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testimonialCell", for: indexPath) as! TestimonialCollectionViewCell
        let testimonial = testimonials[indexPath.row]
        cell.textLabel.text = testimonial["text"]
        cell.nameLabel.text = testimonial["name"]
        cell.jobLabel.text = testimonial["job"]
        cell.avatarImageView.image = UIImage(named: testimonial["avatar"]!)
        return cell
    }
    
}
