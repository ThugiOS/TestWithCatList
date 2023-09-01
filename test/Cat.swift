//
//  Cat.swift
//  test
//
//  Created by Никитин Артем on 31.08.23.
//

import Foundation

typealias Cats = [Cat]

struct Cat: Codable {
    let name: String
    let wikipediaURL: String?
    let referenceImageID: String?
    
//    var logoURL: String? {
//        return "https://cdn2.thecatapi.com/images/\(String(describing: referenceImageID)).jpg"
//    }

    enum CodingKeys: String, CodingKey {
        case name
        case wikipediaURL = "wikipedia_url"
        case referenceImageID = "reference_image_id"
    }
}

