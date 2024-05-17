//
//  NetworkConectable.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import Foundation
import Alamofire

struct ApiParams {
    let urlPath: URL
    let token: String
    let method: Alamofire.HTTPMethod
    let params: [[String: String]]?
}

typealias Responsable<T: Decodable> = Result<T, NetworkError>
typealias ResponseHandler<T: Decodable> = ((Result<T, NetworkError>) -> Void)

final class NetworkConactable: INetworkWorker {
    
    private(set) var afSession: Session?
    
    init(afSession: Session = AF) {
        self.afSession = afSession
    }
    
    func request<T>(with data: ApiParams, resultType: T.Type, handler: ResponseHandler<T>?) where T: Decodable {
        
        let dataRequest = afSession?.request(data.urlPath,
                   method: data.method,
                   headers: [HTTPHeader.authorization(bearerToken: data.token)],
                   requestModifier: { $0.timeoutInterval = 15; $0.cachePolicy = .reloadRevalidatingCacheData })
        
        resolve(request: dataRequest, resultType: resultType.self, handler: handler)
    }
    
    func requestMultipart<T>(with data: ApiParams, resultType: T.Type, handler: ResponseHandler<T>?) where T: Decodable {
        
        guard let formData = multipartComposer(with: data) else {
            handler?(.failure(NetworkError.badRequest(text: "Invalid multipart form data.")))
            return
        }
        
        let dataRequest = afSession?.upload(multipartFormData: formData, to: data.urlPath)
        resolve(request: dataRequest, resultType: resultType.self, handler: handler)
    }
    
    func resolve<T>(request: DataRequest?, resultType: T.Type, handler: ResponseHandler<T>?) where T: Decodable {
        
        request?.responseDecodable(of: resultType.self) { response in
            switch response.result {
            case .success(let data):
                handler?(.success(data))
            case .failure(let error):
                handler?(.failure(NetworkError.makeError(with: response.response?.statusCode,
                                                         description: error.errorDescription)))
            }
        }
    }
    
    func multipartComposer(with data: ApiParams?) -> MultipartFormData? {
        guard let items = data?.params else {
            return nil
        }
        let multipartForm = MultipartFormData()
        
        items.forEach { item in
            if let validData = item.values.first?.data(using: .utf8),
               let validKey = item.keys.first {
                multipartForm.append( validData, withName: validKey)
            }
        }
        
        return multipartForm
    }
}

struct ResponseAuthorizationBearer: Decodable {
    let accessToken: String?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
    }
}
