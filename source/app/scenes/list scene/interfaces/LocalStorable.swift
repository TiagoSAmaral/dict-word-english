//
//  LocalStorable.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation

protocol LocalStorable {
    func fetchItems()
    func saveItem()
    func saveItemLikeFavorite()
}
