//
//  RealmConfiguration.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import RealmSwift
/**
 * RealmMigrationManager é responsável por realizar operações de migração no banco local.
 */
final class RealmMigrationManager {
    
    /**
     *  Usar propriedade `currentValue` para indicar a versão atual do banco sempre que houver alteração
     */
    static func executeMigration() {

        let currentValue: Int = 1
        let configuration = Realm.Configuration(
            schemaVersion: 1) { migration, oldSchemaVersion in
                if oldSchemaVersion < currentValue {
                    // Adicione entidades aqui
                    // migration.create(<#T##typeName: String##String#>)
                    migration.create(WordEntity.classIdentifier)
                    migration.create(FavoriteEntity.classIdentifier)
                    migration.create(MeaningEntity.classIdentifier)
                    migration.create(WordDescriptionCacheEntity.classIdentifier)
                    migration.create(PhoneticEntity.classIdentifier)
                    migration.create(DefinitionEntity.classIdentifier)
                    // motifique entidades aqui
                    // migration.enumerateObjects(ofType: <#T##String#>) { oldObject, newObject in }
                }
            }
        // Atribuindo a configuração ao Realm.
        Realm.Configuration.defaultConfiguration = configuration
        
        #if DEBUG
        debugRealm()
        #endif
    }
    
    static func debugRealm() {
        // Get on-disk location of the default Realm
        let realm = try? Realm()
        debugPrint("Realm is located at:", realm?.configuration.fileURL!)
    }
}
