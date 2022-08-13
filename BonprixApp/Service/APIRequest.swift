//
//  APIRequest.swift
//  BonprixApp
//
//  Created by Anzer Arkin on 13.08.22.
//

import Foundation
import Combine

protocol RequestType {
    associatedtype Response: Decodable
}

struct APIRequest: RequestType {
    typealias Response = Welcome
}
