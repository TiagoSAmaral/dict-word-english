//
//  NetworkConectable.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import Foundation
import Alamofire

/// NetworkConectable é uma interface que permite tornar qualquer classe/struct que a conforme capaz de realizar operações de requisição.
///
/// Esta interface implementa um método para realizar operações de requisição. Podendo ser expandida para envio e recebimento de arquivos.
/// Ela também possui um propriedade que deve receber a instancia que efetivamente realiza as operações. Sua exposição tem como objetivo a flexibilidade de reuso
/// e a capacidade de injeção para testes de requisição.
/// - Property:
///     - requestable: Recebe a instancia de um objeto que pode realizar as operações de requisição.
protocol NetworkConectable: AnyObject {
    func fetch<T: Codable>(data: RequestApi<T>, handler: ((Result<T>) -> Void)?)
//    func fetch<T: Codable>(file: RequestApi<T>, handler: ((Result<T>) -> Void)?)
}

extension NetworkConectable {
    
    var requestable: Session? {
        AF
    }

    /// Realiza a requisição conforme arquivos de configuração e retorna a resposta através de uma closure com passagem de valor generica.
    func fetch<T: Codable>(data: RequestApi<T>, handler: ((Result<T>) -> Void)?) {

        guard let requestable = requestable else {
            handler?(.failure(NetworkError.badRequest(text: LocalizedText.with(tagName: .networkErrorNotDefined))))
            return
        }
        makeRequest(data: data)?.responseDecodable(of: data.resultType.self) { response in
            switch response.result {
            case .success(let result):
                handler?(.success(result))
            case .failure(let error):
                handler?(.failure(NetworkError.badRequest(text: error.localizedDescription)))
            }
        }
    }
    
//    func fetch<T: Codable>(file: RequestApi<T>, handler: ((Result<T>) -> Void)?) {
//        func getJSON(urlToRequest: String) -> Data? {
//            try? Data(contentsOf: URL(string: urlToRequest)!)
//        }
//    
//        func parseJSON(inputData: Data?) -> Dictionary<String, Any>? {
//            guard let inputData = inputData else {
//                print("Invalid Data")
//                return nil
//            }
//            var value: Dictionary<String, Any>?
//    
//            do {
//                value = try JSONSerialization.jsonObject(with: inputData, options: .allowFragments) as? Dictionary<String, Any>
//            } catch(let error) {
//                print(error)
//                return nil
//            }
//    
//            return value
//        }
//    }
    
    private func makeRequest<T: Codable>(data: RequestApi<T>) -> DataRequest? {
        let body: Encodable = data.body ?? EmptyBody()
        let encoderParameter: ParameterEncoder = data.requestType.method == .post ? JSONParameterEncoder.default: URLEncodedFormParameterEncoder.default
        return requestable?.request(data.urlPath,
                                       method: data.requestType.method,
                                       parameters: body,
                                          encoder: encoderParameter,
                                       headers: formattHeader(with: data.headers),
                                       interceptor: nil,
                                       requestModifier: { $0.timeoutInterval = 15; $0.cachePolicy = .reloadRevalidatingCacheData })
    }
    
    /// Realiza a formatação da lista de parametros para o formato do Header requerido pela requisição.
    private func formattHeader(with values: KeyValueParameters?) -> Alamofire.HTTPHeaders? {

        guard let elements = values?.elements else {
            return nil
        }

        var alamofireHeaders = Alamofire.HTTPHeaders()

        for item in elements {
            if let value = item.value as? String, value != .empty {
                alamofireHeaders.add(name: item.name, value: value)
            }
        }

        return alamofireHeaders
    }
}
