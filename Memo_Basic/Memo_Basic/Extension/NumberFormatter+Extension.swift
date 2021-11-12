//
//  NumberFormatter+Extension.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/12.
//

import Foundation

extension NumberFormatter {
    
    static var customFormatter: NumberFormatter {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        return numberFormatter
    }
    
}
