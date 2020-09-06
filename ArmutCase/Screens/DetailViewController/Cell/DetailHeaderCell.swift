//
//  detailHeaderCell.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 6.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

class DetailHeaderCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet weak var btnBack: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showContent(detail:DetailResponse?){
        if detail != nil{
            let url = URL(string: detail!.imageURL)
            self.img.sd_setImage(with: url) { (image, error, type, url) in}
            self.lblTitle.text = detail?.name
        }
    }
}
