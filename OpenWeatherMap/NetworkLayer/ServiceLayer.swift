//
//  ServiceLayer.swift
//  OpenWeatherMap
//
//  Created by Sarin Swift on 8/2/19.
//  Copyright © 2019 sarinswift. All rights reserved.
//

import Foundation

class ServiceLayer {
    class func requestWeather(city: String, router: Router, completion: @escaping (Result<[String: [City]], Error>) -> ()) {
        
        // create components
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.paramters
        
        // create the url request
        guard let url = components.url else {
            return
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        // start the request!
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                completion(.failure(error!))
                print(error?.localizedDescription as Any)
                return
            }
            guard response != nil else {
                print("Contains No Response")
                return
            }
            guard let data = data else {
                print("Contains No Data")
                return
            }
            
            // decode the json object from the data
            let object = try! JSONDecoder().decode([String: [City]].self, from: data)
            DispatchQueue.main.async {
                completion(.success(object))
            }
        }
        dataTask.resume()
    }
}
