//
//  RequestMethods.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation
import Alamofire

/// RequestMethods deve ser usada ao longo do app para configurar o método da requisição.
///
/// Usado para encapsular/abstrair o uso concreto de qualquer outro seletor de métodos de requisição
/// de outros frameworks.
enum RequestMethods {
    case connect
    case delete
    case get
    case head
    case options
    case patch
    case post
    case put
    case query
    case trace
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .connect:
            return Alamofire.HTTPMethod.connect
        case .delete:
            return Alamofire.HTTPMethod.delete
        case .get:
            return Alamofire.HTTPMethod.get
        case .head:
            return Alamofire.HTTPMethod.head
        case .options:
            return Alamofire.HTTPMethod.options
        case .patch:
            return Alamofire.HTTPMethod.patch
        case .post:
            return Alamofire.HTTPMethod.post
        case .put:
            return Alamofire.HTTPMethod.put
        case .query:
            return Alamofire.HTTPMethod.query
        case .trace:
            return Alamofire.HTTPMethod.trace
        }
    }
}
