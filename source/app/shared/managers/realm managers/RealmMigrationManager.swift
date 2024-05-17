//
//  RealmConfiguration.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import RealmSwift

final class RealmMigrationManager {
    
    static func executeMigration() {
        /**
         * Arquivo de configuração de migração do Realm.
         *  Usar propriedade `currentValue` para indicar a versão atual do banco sempre que houver alteraç˜
         */
        let currentValue: Int = 1
        let configuration = Realm.Configuration(
            schemaVersion: 1) { migration, oldSchemaVersion in
                if oldSchemaVersion < currentValue {
                    
                    // Adicone novas entidades aqui
                    // migration.create(<#T##typeName: String##String#>)
                }
            }
        // Atribuindo a configuração ao Realm.
        Realm.Configuration.defaultConfiguration = configuration
    }
}
