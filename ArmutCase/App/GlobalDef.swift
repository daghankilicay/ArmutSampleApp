//
//  GlobalDef.swift
//  ArmutCase
//
//  Created by Dağhan KILIÇAY on 4.09.2020.
//  Copyright © 2020 Dağhan KILIÇAY. All rights reserved.
//

import UIKit

func screen() -> CGRect {
    return UIScreen.main.bounds
}

func isIphone_4() -> Bool {
   return (fabs(Double.init(screen().size.height - 480)) < .ulpOfOne)
}

func isIphone_5() -> Bool {
    return (fabs(Double.init(screen().size.height - 568)) < .ulpOfOne)
}

func isIphone_6() -> Bool {
    return (fabs(Double.init(screen().size.height - 667)) < .ulpOfOne)
}

func isIphone_6_plus() -> Bool {
    return (fabs(Double.init(screen().size.height - 736)) < .ulpOfOne)
}

func isIphone_X() -> Bool {
    return screen().equalTo(CGRect(x: 0, y: 0, width: 375, height: 812))
}

func isIphone_Xmax() -> Bool {
    return screen().equalTo(CGRect(x: 0, y: 0, width: 414, height: 896))
}
