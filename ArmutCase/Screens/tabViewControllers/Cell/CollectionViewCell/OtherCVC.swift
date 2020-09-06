//
//  OtherCVC.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 5.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

class OtherCVC: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblProCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.img.layer.cornerRadius = 5
    }
    
    
    func showContent(trending:Trending?){
        if trending != nil{
            let url = URL(string: trending!.imageURL)
            self.img.sd_setImage(with: url) { (image, error, type, url) in}
            self.lblTitle.text = trending?.name
            self.lblProCount.text = "Yakınınızdaki \(trending?.proCount ?? 0 ) Profesyonel "
            
        }
    }

}
