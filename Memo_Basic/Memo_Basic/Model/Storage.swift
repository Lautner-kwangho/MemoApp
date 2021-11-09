//
//  UserDefaults.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/09.
//

import UIKit

public class Storage {
    static func isFirstTime() -> Bool {
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "isFirst") == nil {
            defaults.set("Y", forKey: "isFirst")
            return true
        } else {
            return false
        }
    }
}
