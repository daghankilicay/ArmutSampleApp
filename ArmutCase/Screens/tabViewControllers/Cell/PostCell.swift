//
//  PostCell.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 5.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    
    
    var post : [Post]? {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var layout = UICollectionViewFlowLayout()
    
    var itemSelected:((Post) -> Void)?
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
         self.collectionView.register(UINib(nibName: "PostCVC", bundle: nil), forCellWithReuseIdentifier: "PostCVC")
         collectionView.setCollectionViewLayout(layout, animated: false)
         collectionView.dataSource = self
         collectionView.delegate = self
     }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemWidth = screen().width * 0.4
        let itemHeight = itemWidth * 1.3
        layout.minimumLineSpacing = self.frame.width * 0.02933
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width:itemWidth , height:itemHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.post!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PostCVC", for: indexPath) as! PostCVC
        cell.showContent(post: self.post![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.itemSelected != nil {
            self.itemSelected!(self.post![indexPath.row])
        }
    }
    
}
