//
//  Cat.swift
//  test
//
//  Created by Никитин Артем on 1.09.23.
//

import Foundation

struct Cat: Codable {
    let name: String
    let wikipediaURL: String?
    let referenceImageID: String?

    enum CodingKeys: String, CodingKey {
        case name
        case wikipediaURL = "wikipedia_url"
        case referenceImageID = "reference_image_id"
    }
}

