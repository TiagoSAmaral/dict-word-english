//
//  LocalizedText.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import Foundation

final class LocalizedText {
    
    enum LocalizeTags: String {
            case networkErrorNotDefined
            case networkOffline
            case serverNotResponse
            case pullToRefreshText
            case tokenIsRequired
            case localizationApi
            case nameText
            case setText
            case rarityText
            case attackText
            case costText
            case healthText
            case keyadvisorNotFound
            case urlAuthorizationNotFound
            case lastPage
        }
    static func with(tagName: LocalizeTags) -> String {
        return NSLocalizedString(tagName.rawValue, bundle: Bundle(for: LocalizedText.self), comment: "")
    }
    
    static func with<T: AnyObject>(tagName: LocalizeTags, bundleClass: T.Type) -> String {
        return NSLocalizedString(tagName.rawValue, bundle: Bundle(for: bundleClass.self), comment: "")
    }
}
