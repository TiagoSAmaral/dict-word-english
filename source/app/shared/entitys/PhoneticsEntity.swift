//
//  Phonetics.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation
import RealmSwift

class PhoneticEntity: Object, Codable, IModel {
    @Persisted(primaryKey: true) var identifier: ObjectId
    @Persisted var text: String
    @Persisted var audio: String
    @Persisted var sourceURL: String?
}
