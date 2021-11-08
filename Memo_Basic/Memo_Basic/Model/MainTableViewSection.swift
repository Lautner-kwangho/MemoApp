//
//  MainTableViewSection.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/08.
//

import Foundation

enum MainTableViewSection: Int, CaseIterable {
    case fixmemo
    case lastmemo
    
    var description: String {
        switch self {
        case .fixmemo:
            return "고정된 메모"
        case .lastmemo:
            return "메모"
        }
    }
}
