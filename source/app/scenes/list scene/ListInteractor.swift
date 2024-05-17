//
//  ListInteractor.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import Foundation

final class ListInteractor {
    
    var localStorageWorker: LocalStorable?
    var fetchApiWorker: ApiRequestable?
    var presenter: ListPresentable?
    
    func fetchListFromRemote() {
    }
    
    func fetchFavoritesFromLocal() {
    }
    
    func fetchHistoryFromLocal() {
    }
    
    func sendContentToView(content: IModel) {
        presenter?.render(content)
    }
}
