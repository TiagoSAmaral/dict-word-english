//
//  MeaningModel.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation
import RealmSwift

class MeaningEntity: Object, Codable, IModel {
    @Persisted(primaryKey: true) var identifier: ObjectId
    @Persisted var partOfSpeech: String? = .empty
    @Persisted var definitions = List<DefinitionEntity>()
}
