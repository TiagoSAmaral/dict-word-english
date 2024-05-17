//
//  DefinitionModel.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation
import RealmSwift

class DefinitionEntity: Object, Codable, IModel {
    @Persisted(primaryKey: true) var identifier: ObjectId
    @Persisted var definition: String? = .empty
    @Persisted var example: String? = .empty
}
