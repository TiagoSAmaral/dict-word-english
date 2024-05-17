//
//  Word.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation
import RealmSwift

class WordEntity: Object {
    @Persisted(primaryKey: true) var identifier: ObjectId
    @Persisted var word: String = .empty
    
    init(word: String) {
        self.word = word
        super.init()
    }
    
    convenience override init() {
        self.init(word: .empty)
    }
}
