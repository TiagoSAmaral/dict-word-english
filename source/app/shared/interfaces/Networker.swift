//
//  INetworker.swift
//  dictWordEnglish
//
//  Created by Tiago Amaral on 16/05/24.
//

import Foundation

protocol NetworkWorker {
    func request<T: Decodable>(with data: ApiParams, resultType: T.Type, handler: ResponseHandler<T>?) where T: Decodable
    func requestMultipart<T>(with data: ApiParams, resultType: T.Type, handler: ResponseHandler<T>?) where T: Decodable
}
