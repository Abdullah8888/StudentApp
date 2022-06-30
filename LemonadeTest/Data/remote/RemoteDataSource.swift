//
//  RemoteDataSource.swift
//  LemonadeTest
//
//  Created by Abdullah on 30/06/2022.
//

import Foundation
import Alamofire

struct RemoteDataSourceErrorModel: Codable, Error {
    let message: String?
}

class AppConfiguration {
    
    static let baseUrl: String = {
        return Bundle.main.object(forInfoDictionaryKey: "BaseUrl") as! String
    }()
}

class RemoteDataSource {
    
    func fetch<T>(relativePath urlString: String, method: HTTPMethod, type: T.Type, completionHandler completion: @escaping (Result<T, RemoteDataSourceErrorModel>) -> Void) where T : Decodable, T : Encodable {
        
        guard let url = URL(string: AppConfiguration.baseUrl + urlString) else {
            return
        }
        debugPrint("full url is \(AppConfiguration.baseUrl + urlString)")

        var makeRequest = URLRequest(url: url)
        makeRequest.httpMethod = method.rawValue
        //makeRequest.headers = headers


        AF.request(makeRequest).responseDecodable(of: type.self) { response in
            switch response.result {
            case .success:
                if let data = response.data {
                    if let decodedResponse = try? JSONDecoder().decode(type.self, from: data) {
                        completion(.success(decodedResponse))
                    }
                    else {
                        if let decodedResponse = try? JSONDecoder().decode(RemoteDataSourceErrorModel.self, from: data) {
                            completion(.failure(decodedResponse))
                        }
                        else {
                            let error = RemoteDataSourceErrorModel(message: "Unable to parse JSON")
                            completion(.failure(error))
                        }
                    }
                }
            case let .failure(error):
                let error = RemoteDataSourceErrorModel(message: error.errorDescription)
                completion(.failure(error))
            }
        }
    }

}
