//
//  NetworkService.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import Foundation

class NetworkService {
    
    private func createURL() -> URL? {
        let tunnel = "https://"
        let server = "api.thecatapi.com"
        let endpoint = "/v1/breeds"
        let urlStr = tunnel + server + endpoint
        let url = URL(string: urlStr)
        return url
    }
    
    func fetchCats(page: Int, itemsPerPage: Int, completion: @escaping ([Cat]?) -> Void) {
        guard let url = createURL() else {
            completion(nil)
            return
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        components?.queryItems = [
            URLQueryItem(name: "page", value: String(page)),
            URLQueryItem(name: "limit", value: String(itemsPerPage))
        ]

        guard let finalURL = components?.url else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error fetching data: \(error)")
                completion(nil)
                return
            }
            
            if let data = data {
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
