//
//  HoroscopeAPIClient.swift
//  UserDefaultsHoroscope
//
//  Created by Kelby Mittan on 1/15/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import UIKit

struct HoroscopeAPIClient {
    static func getHoroscope(for sign: String, completion: @escaping (Result<Horoscope,AppError>) -> ()) {

        let horoscopeEndpointString = "http://sandipbgt.com/theastrologer/api/horoscope/\(sign.lowercased())/today"

        guard let url = URL(string: horoscopeEndpointString) else {
            completion(.failure(.badURL(horoscopeEndpointString)))
            return
        }

        let request = URLRequest(url: url)

        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let horoscopeData = try JSONDecoder().decode(Horoscope.self, from: data)
                    completion(.success(horoscopeData))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
}

