//
//  DetailWorkCell.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 6.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

class DetailWorkCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFirst: UILabel!
    @IBOutlet weak var lblSecond: UILabel!
    @IBOutlet weak var lblthird: UILabel!
    
    @IBOutlet weak var lblAnswer: UILabel!
    @IBOutlet weak var lblQuote: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.lblAnswer.text = "Soruları cevapla"
        self.lblQuote.text = "Teklif al"
        self.lblPrice.text = "Fiyatları karşılaştır ve karar ver"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.setCircle(label: lblFirst)
        self.setCircle(label: lblSecond)
        self.setCircle(label: lblthird)
    }
    
    private func setCircle(label:UILabel){
        label.layer.borderWidth = 1
        label.layer.masksToBounds = true
        label.layer.borderColor = UIColor .black.cgColor
        label.layer.cornerRadius = label.frame.height / 2
    }
}
