//
//  NetworkService.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import Foundation

class NetworkService {
    private let urlString = "https://api.thecatapi.com/v1/breeds"
    
    func fetchCats(completion: @escaping ([Cat]?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            if let data {
                do {
                    let cats = try JSONDecoder().decode([Cat].self, from: data)
                    completion(cats)
                } catch {
                    print("Error decoding data: \(error)")
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
