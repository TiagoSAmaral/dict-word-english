//
//  Favorite.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import RealmSwift

class FavoriteEntity: Object, IModel {
    @Persisted(primaryKey: true) var identifier: ObjectId
    @Persisted var wordIdentifier: ObjectId?
    @Persisted var userIdentifier: ObjectId?
    
    init(wordIdentifier: String, userIdentifier: String? = nil) {
        self.wordIdentifier = try? ObjectId(string: wordIdentifier)
        if let userIdentifier = userIdentifier {
            self.userIdentifier = try? ObjectId(string: userIdentifier)
        }
        super.init()
    }
    
    convenience override init() {
        self.init(wordIdentifier: .empty)
    }
}
