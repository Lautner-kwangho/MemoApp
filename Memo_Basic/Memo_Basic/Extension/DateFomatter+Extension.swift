//
//  DateFomatter+Extension.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/11.
//

import Foundation

extension DateFormatter {
    static var customFormatter: DateFormatter {
        let date = Date()
        
        //    let yesterDay =
//        let yesterDay = Calendar.
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd aa hh:mm"
        
//        dateFormatter.dateFormat = "E"
        
//        dateFormatter.dateFormat = "aa hh:mm"
        
        return dateFormatter
    }

}
