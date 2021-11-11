//
//  MainVC+RealmModel.swift
//  Memo_Basic
//
//  Created by 최광호 on 2021/11/10.
//

import Foundation
import RealmSwift

class RealmModel: Object {
    @Persisted var title: String
    @Persisted var content: String
    @Persisted var registDate = Date()
    @Persisted var favorite: Bool
    @Persisted(primaryKey: true) var _id: ObjectId
    
    convenience init(title: String, content: String, registDate: Date) {
        self.init()
        self.title = title
        self.content = content
        self.registDate = registDate
        self.favorite = false
    }
}
