//
//  detailInfo.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 6.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

class DetailInfoCell: UITableViewCell {

    @IBOutlet weak var lblPros: UILabel!
    @IBOutlet weak var lblAvarage: UILabel!
    @IBOutlet weak var lblComplated: UILabel!
    @IBOutlet weak var lblFree: UILabel!
    @IBOutlet weak var lblGuarantee: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func showContent(detail:DetailResponse?){
        if detail != nil{
            self.lblPros.attributedText = self.setAttribute(text: "\(detail?.proCount ?? 0)", textSecond: " yakınınızdaki profesyoneller", color: .orange)
            self.lblAvarage.attributedText = self.setAttribute(text: "\(detail?.averageRating ?? 0)", textSecond: " ortalama puanı", color: .orange)
            self.lblComplated.text = " Geçen ay \(detail?.completedJobsOnLastMonth ?? 0) \(detail?.name ?? "") işi tamamlandı"
            self.lblFree.text = "Ücretsiz Teslimat"
            self.lblGuarantee.text = "Servis Garantili"
        }
    }
    
    private func setAttribute(text:String,textSecond:String,color:UIColor) ->NSMutableAttributedString {
        let attrsDay = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .medium), NSAttributedString.Key.foregroundColor : color]
        
        let attrsTime = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15, weight: .medium), NSAttributedString.Key.foregroundColor : UIColor.black]

        let attributedString1 = NSMutableAttributedString(string:"\(text)", attributes:attrsDay)
        let attributedString2 = NSMutableAttributedString(string:"\(textSecond) ", attributes:attrsTime)
        
        attributedString1.append(attributedString2)
        return attributedString1
    }
}
