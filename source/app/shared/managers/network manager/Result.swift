//
//  Result.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
