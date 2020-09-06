//
//  ProgressView.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 6.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

class ProgressView: UIView {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    static func showProgress() -> ProgressView {
        
        let design = Bundle.main.loadNibNamed("ProgressView", owner: self, options: nil)?[0] as! ProgressView
        design.frame = screen()
//        let window = UIApplication.shared.keyWindow
        
        let keyWindow = UIApplication.shared.connectedScenes
        .filter({$0.activationState == .foregroundActive})
        .map({$0 as? UIWindowScene})
        .compactMap({$0})
        .first?.windows
        .filter({$0.isKeyWindow}).first
        
        keyWindow?.addSubview(design)
        keyWindow?.bringSubviewToFront(design)
        design.indicator.startAnimating()
        
         return design
    }

}
