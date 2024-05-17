//
//  RequestApi.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 17/05/24.
//

import Foundation

/// RequestAPI é uma struct usada para configurar um pedido de requisição.
///
/// Quando realizar operações de reuisição, deve ser criada uma nova instancia, preenchendo todas as propriedades obrigatórias.
///
/// - Parameter:
///     - urlPath: Uma string contendo a URL para o serviço de API bem como a rota para realziar uma operação de requisição.
///     - requestType: O tipo de método que a requisição irá operar. Os mais frequentes são `.GET` e `.POST`.
///     - headers: Informações no formato `key` e `value`, levando informação sobre identificação e segurança.
///     - body: É usado em requisições do método `.POST` para enviar dados a API.
///     - resultType: É o tipo ou formato da resposta esperada no fim da requisição.
struct RequestApi<T> where T: Codable {
    
    var urlPath: String
    var requestType: RequestMethods
    var headers: KeyValueParameters?
    var body: Encodable?
    var resultType: T.Type
    var data: Data?
}
