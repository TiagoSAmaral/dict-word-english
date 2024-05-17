//
//  NetworkError.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import Foundation

enum NetworkError: Error {

    case offline(text: String)
    case badRequest(text: String)
    case notDefined(text: String)

    var message: String {
        switch self {
        case .badRequest(let text), .offline(let text), .notDefined(text: let text):
            return text
        }
    }

    static func makeError(with status: Int?, description: String? = nil) -> NetworkError {
        let messageNotDefinedError = LocalizedText.with(tagName: .networkErrorNotDefined)
        if let status = status {
            if status == -1 {
                return .offline(text: description ?? LocalizedText.with(tagName: .networkOffline))
            }
            
            if 400 ... 499 ~= status {
                return .badRequest(text: description ?? messageNotDefinedError)
            }
            
            if status > 499 {
                return .notDefined(text: description ?? LocalizedText.with(tagName: .serverNotResponse))
            }
        }
        return .notDefined(text: messageNotDefinedError)
    }
}
