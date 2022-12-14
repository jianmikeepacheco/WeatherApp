//
//  API.swift
//  Weatherly
//
//  Created by jian.mikee.pacheco on 9/8/22.
//

import Foundation

struct weatherAPI {
    static func getURLWeather(latitude: Double, longitude: Double) -> String {
        return "https://api.openweathermap.org/data/2.5/forecast?lat=\(latitude)&lon=\(longitude)&appid=378be90077518412616838336958f7a9&units=metric"
    }
}

final class NetworkManager<T: Codable> {
    static func fetchWeather(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard error == nil else {
                print(String(describing: error))
                if let error = error?.localizedDescription {
                    completion(.failure(.error(err: error)))
                }
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}

