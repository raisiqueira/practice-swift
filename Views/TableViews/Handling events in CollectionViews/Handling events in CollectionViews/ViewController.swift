//
//  ViewController.swift
//  Handling events in CollectionViews
//
//  Created by Domenico Solazzo on 11/05/15.
//  License MIT
//

import UIKit

class ViewController: UICollectionViewController {
    let allImages = [
        UIImage(named: "1"),
        UIImage(named: "2"),
        UIImage(named: "3")
    ]
    
    func randomImage() -> UIImage{
        let randomNumber = arc4random_uniform(UInt32(allImages.count))
        let randomImage = allImages[Int(randomNumber)]
        return randomImage!
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        let nib = UINib(nibName: "MyCollectionViewCell", bundle: nil)
        
        collectionView!.register(nib, forCellWithReuseIdentifier: "cell")
        collectionView!.backgroundColor = UIColor.white
    }
    
    convenience required init?(coder aDecoder: NSCoder) {
        let flowLayout = UICollectionViewFlowLayout()
        
        flowLayout.minimumLineSpacing = 20
        flowLayout.minimumInteritemSpacing = 10
        flowLayout.itemSize = CGSize(width: 80, height: 120);
        flowLayout.scrollDirection = .vertical
        
        flowLayout.sectionInset =
            UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
        self.init(collectionViewLayout: flowLayout)
    }
    
    override func numberOfSections(
        in collectionView: UICollectionView) -> Int {
            /* Between 3 to 6 sections */
            return Int(3 + arc4random_uniform(4))
    }
    
    override func collectionView(_ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            /* Each section has between 10 to 15 cells */
            return Int(10 + arc4random_uniform(6))
    }
    
    override func collectionView(_ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
            
            cell.imageViewBackgroundImage.image = randomImage()
            cell.imageViewBackgroundImage.contentMode = .scaleAspectFit
            
            return cell
            
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Fade-in / out of a cell when selected
        let selectedCell = collectionView.cellForItem(at: indexPath) as UICollectionViewCell?
        let animationDuration = 1.5;
        // Animation 
        UIView.animate(withDuration: animationDuration, animations: {
            selectedCell!.alpha = 0;
            }, completion:{[weak self](succeeded:Bool) in
                UIView.animate(withDuration: animationDuration, animations: {
                    selectedCell!.alpha = 1;
                })
            })
    }
    
    override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as UICollectionViewCell?
        
        UIView.animate(withDuration: 1, animations: {
            selectedCell?.transform = CGAffineTransform(scaleX: 2, y: 2)
        })
    }
    
    override func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as UICollectionViewCell?
        
        UIView.animate(withDuration: 1, animations: {
            selectedCell?.transform = CGAffineTransform.identity
        })
    }
}

