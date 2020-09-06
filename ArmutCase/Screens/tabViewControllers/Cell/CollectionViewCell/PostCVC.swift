//
//  PostCVC.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 5.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

class PostCVC: UICollectionViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.img.layer.cornerRadius = 5
    }
    
    func showContent(post:Post?){
        if post != nil{
            let url = URL(string: post!.imageURL)
            self.img.sd_setImage(with: url) { (image, error, type, url) in}
            self.lblTitle.text = post?.title
            self.lblCategory.text = post?.category
        }
    }
}
