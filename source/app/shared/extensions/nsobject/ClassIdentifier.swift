//
//  ClassIdentifier.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import Foundation

protocol ClassIdentifier {}

extension ClassIdentifier where Self: NSObject {
    static var classIdentifier: String {
        String(describing: self)
    }
}

extension NSObject: ClassIdentifier {}
