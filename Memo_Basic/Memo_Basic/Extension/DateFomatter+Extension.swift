//
//  DateFomatter+Extension.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/11.
//

import Foundation

extension DateFormatter {
    
    static var customFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "yyyy.MM.dd aa hh:mm"
        return dateFormatter
    }
    
    static var yesterdayFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "aa hh:mm"
        return dateFormatter
    }
    
    static var weeklyFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
        dateFormatter.dateFormat = "E"
        return dateFormatter
    }

}
