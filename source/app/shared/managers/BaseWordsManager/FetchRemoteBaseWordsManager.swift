//
//  LoadBaseWordsManager.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation

class FetchRemoteBaseWordsManager: NetworkConectable, LocalStorableManager {
    
    func fetchBaseList(handler: ((Bool) -> Void)?) {
        
        let data = RequestApi(urlPath: "https://raw.githubusercontent.com/dwyl/english-words/master/words_dictionary.json",
                              requestType: .get,
                              resultType: Dictionary<String, Int>.self)
        
        fetch(data: data) { [weak self] response in
            switch response {
            case .success(let value):
                let baseList = value.keys.compactMap({ WordEntity(word: $0) })
                // Save in realm here
                self?.save(items: baseList) { isSuccess in
                    handler?(isSuccess)
                }
            case .failure:
                handler?(false)
            }
        }
    }
}
