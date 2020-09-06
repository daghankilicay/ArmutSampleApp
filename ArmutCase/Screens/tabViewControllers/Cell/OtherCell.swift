//
//  OtherCell.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 5.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit



class OtherCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout  {
    
//    var trending : [Trending] = []
    
    @IBOutlet weak var lblTitle: UILabel!
    var trending : [Trending]? {
        didSet {
            self.collectionView.reloadData()
        }
    }

    @IBOutlet weak var collectionView: UICollectionView!
    var layout = UICollectionViewFlowLayout()
    var itemSelected:((Int) -> Void)?
    
    
    override func awakeFromNib() {
         super.awakeFromNib()
        
         self.collectionView.register(UINib(nibName: "OtherCVC", bundle: nil), forCellWithReuseIdentifier: "OtherCVC")
         collectionView.setCollectionViewLayout(layout, animated: false)
         collectionView.dataSource=self
         collectionView.delegate=self
     }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let itemWidth = screen().width * 0.38
        let itemHeight = itemWidth * 1.3885
        let textHeight = collectionView.frame.height - itemHeight
        layout.minimumLineSpacing = self.frame.width * 0.02933
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width:itemWidth , height:itemHeight + textHeight )
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.trending!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherCVC", for: indexPath) as! OtherCVC
        cell.showContent(trending: self.trending![indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.itemSelected != nil {
            self.itemSelected!(self.trending![indexPath.row].id)
        }
    }
    
}
