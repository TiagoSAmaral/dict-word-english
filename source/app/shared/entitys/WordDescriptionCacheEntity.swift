//
//  WordDescriptionCache.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation
import RealmSwift

class WordDescriptionCacheEntity: Object, Codable, IModel {
    @Persisted(primaryKey: true) var identifier: ObjectId?
    @Persisted var word: String? = .empty
    @Persisted var phonetic: String? = .empty
    @Persisted var phonetics = List<PhoneticEntity>()
    @Persisted var meanings = List<MeaningEntity>()
}
