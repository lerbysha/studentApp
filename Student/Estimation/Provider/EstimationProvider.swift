//
//  QuestionnaireProvider.swift
//  Student
//
//  Created by Artur Gaisin on 21.09.2020.
//  Copyright © 2020 Artur Gaisin. All rights reserved.
//

import Foundation
import Moya

private func JSONResponseDataFormatter(_ data: Data) -> String {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
    } catch {
        return String(data: data, encoding: .utf8) ?? ""
    }
}

public struct EstimationModel: Decodable {
    
    var subject: String
    var punctuality: String
    var objectivity: String
    var citizenship: String
    var knowladge: String
    var benefit: String
    var question: String
    
}

protocol EstimationProviderProtocol {
    func emailEstimation(email: String, password: String)
}

final class EstimationProvider: EstimationProviderProtocol {
    let provider = MoyaProvider<EstimationAPI>(plugins: [NetworkLoggerPlugin(configuration: .init(formatter: .init(responseData: JSONResponseDataFormatter),
    logOptions: .verbose))])

    func emailEstimation(email: String, password: String) {
        provider.request(.emailEstimation(email, password)) { result in
            do {
                let response = try result.get()
                let value = try response.map(EstimationModel.self)
                
            } catch {
                let printableError = error as CustomStringConvertible
                print(printableError)
            }
        }
    }
}

