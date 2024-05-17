//
//  RealmManager.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import RealmSwift

protocol LocalStorableManager {}

extension LocalStorableManager {
    
    var realm: Realm? {
        try? Realm()
    }
    
    func save<T>(items: T, handler: ((Bool) -> Void)?) where T: Sequence, T.Element: Object {
        guard let realm = realm else {
            handler?(false)
            return
        }
        try? realm.write {
            realm.add(items)
        }
        handler?(true)
    }
    
    func hasItemsIn<T: Object>(collection: T.Type) -> Bool {
        do {
            guard let items = realm?.objects(collection.self) else {
                return false
            }
            return !items.isEmpty
        }
    }
}
